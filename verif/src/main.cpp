/**
 * @file main.cpp
 * @author Andrew Osterhout
 * @brief 
 * @version 0.1
 * @date 2023-04-05
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include "TraceReader.hpp"
#include "StateMachine.hpp"

#include <scabbard/MetadataIO.hpp>
#include <glob/glob.hpp>

#include <iostream>


void printResult(std::ostream& out,
                  const scabbard::MetadataJSONFile_t& MF,
                  const scabbard::TraceFile& TF, 
                  const scabbard::verif::StateMachine::Result& res);

int main(int argc, char *argv[]) {
  using namespace ::scabbard::verif;
  if (argc != 3) {
    std::cerr << "incorrect input provided, please provide a file path to a scabbard metadata file "
                 "AND to some number of scabbard trace files (in that order) (wildcard/glob notation accepted for trace files)"
              << std::endl;
    exit(EXIT_FAILURE);
  }

  auto mf = scabbard::read_metadata_file(std::string(argv[1]));
  StateMachine::Results results;

  for (size_t i=2ull; i<argc; ++i)
    for (auto path : glob::glob(argv[i])) {
      auto tf = scabbard::verif::readTraceFile(path.string());
      scabbard::verif::StateMachine sm(tf.trace_data);
      sm.run(results);
    }

  std::string sep = "";
  for (auto result : results) {
    std::cout << sep; 
    switch (result.first.status)
    {
      case StateMachine::ResultStatus::ERROR:
        std::cout << '\n' << result.second << "x DATA RACE(S) were detected; deriving from the src locations detailed in the sampled event below!\n";
        printResult(std::cout, mf, tf, result.first);
        break;

      case StateMachine::ResultStatus::WARNING:
        std::cout << '\n' << result.second << "x POSSIBLE data race(s) were detected; deriving from the src locations detailed in the sampled event below!\n";
        printResult(std::cout, mf, tf, result.first);
        break;

      case StateMachine::ResultStatus::GOOD:
        std::cout << "\nNO data races were found :)\n"; 
        break;

      case StateMachine::ResultStatus::INTERNAL_ERROR:
        std::cout << result.first.err_msg << std::endl;
        std::cout << "(x" << result.second << ')' << std::endl; break; //DEBUG
        // return EXIT_FAILURE;
      default:
        std::cerr << "!unknown result code!" << std::endl;
        return EXIT_FAILURE;
    }
    sep = "\n========\n";
  }
  return 0;
}

void printResult(std::ostream& out, 
                  const scabbard::MetadataJSONFile_t& MF,
                  const scabbard::TraceFile& TF,
                  const scabbard::verif::StateMachine::Result& res)
{
  using namespace ::scabbard::verif;
  if (res.status == StateMachine::ResultStatus::GOOD) {
    out << res.status;
    return;
  }
  const scabbard::SrcMetadata UNKNOWN_METADATA{UINT64_MAX,"<UNKNOWN_SRC_FILE>",0ul,0ul,scabbard::instr::ModuleType::UNKNOWN_MODULE};
  auto printRead = [&]() -> void {
    auto it = MF.find(res.read->metadata);
    const scabbard::SrcMetadata& meta = ((it != MF.end()) ? it->second : UNKNOWN_METADATA);
    out << "    READ: {\n" 
           "                time: " << res.read->time_stamp << " (logical),\n"
           "              device: CPU,\n"
           "           thread id: 0x" << std::hex << std::hash<std::thread::id>{}(res.read->threadId.host) << std::dec << ",\n"
           "             src loc: \"" << meta.srcFile << ':' << meta.line << ',' << meta.col << "\"\n"
           "          }";
  };
  auto printWrite = [&]() -> void {
    auto it = MF.find(res.write->metadata);
    const scabbard::SrcMetadata& meta = ((it != MF.end()) ? it->second : UNKNOWN_METADATA);
    out << "   WRITE: {\n" 
           "               time: " << res.write->time_stamp << " (logical),\n"
           "              device: GPU,\n"
           "           thread id: {\n"
           "                           id: {stream: 0x" << std::hex << res.write->threadId.device.job.STREAM << std::dec << ", job#: " << res.write->threadId.device.job.JOB << "},\n"
           "                        block: {x:" << res.write->threadId.device.block.x << 
                                         ", y:" << res.write->threadId.device.block.y << 
                                         ", z:"<< res.write->threadId.device.block.z <<"},\n"
           "                       thread: {x:" << res.write->threadId.device.thread.x << 
                                         ", y:" << res.write->threadId.device.thread.y << 
                                         ", z:"<< (uint16_t)res.write->threadId.device.thread.z <<"}\n"
           "                      },\n"
           "            src loc: \"" << meta.srcFile << ':' << meta.line << ',' << meta.col << "\"\n"
           "          }";
  };
  out << "  RESULT: `" << res.status << "`,\n";
  if (res.err_msg != "")
    out << " MESSAGE: \"" << res.err_msg << "\",\n";
  out << "  MEM LOC: 0x" << std::hex << ((res.read) ? res.read->ptr : res.write->ptr) << std::dec << ",\n"
         "METADATA: {" << res.read->data << "},\n";
  
  if (not res.write) { //case there is no write data
    printRead();
    out << std::endl;
    return;
  }
  
  if (res.read->time_stamp > res.write->time_stamp) {
    printWrite();
    out << ",\n";
    printRead();
    out << std::endl;
    return;
  }

  printRead();
  out << ",\n";
  printWrite();
  out << std::endl;
                                      
}
