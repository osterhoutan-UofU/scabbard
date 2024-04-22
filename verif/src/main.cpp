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

#include <iostream>


void printResult(std::ostream& out, 
                  const scabbard::TraceFile& TF, 
                  const scabbard::verif::StateMachine::Result& res);

int main(int argc, char *argv[]) {
  using namespace ::scabbard::verif;
  if (argc != 2) {
    std::cerr << "incorrect input provided, please provide a file path to a scabbard trace file" 
              << std::endl;
    exit(EXIT_FAILURE);
  }

  auto tf = scabbard::verif::readTraceFile(std::string(argv[1]));

  scabbard::verif::StateMachine sm(tf.trace_data);
  auto results = sm.run();

  std::string sep = "";
  for (auto result : results) {
    std::cout << sep; 
    switch (result.status)
    {
      case StateMachine::ResultStatus::ERROR:
        std::cout << "\nA data race was detected!\n";
        printResult(std::cout, tf, result);
        break;

      case StateMachine::ResultStatus::WARNING:
        std::cout << "\nA POSSIBLE data race was detected!\n";
        printResult(std::cout, tf, result);
        break;

      case StateMachine::ResultStatus::GOOD:
        std::cout << "\nNO data races were found :)\n"; 
        break;

      case StateMachine::ResultStatus::INTERNAL_ERROR:
        std::cout << result.err_msg << std::endl;
        return EXIT_FAILURE;
      default:
        std::cerr << "!unknown result code!" << std::endl;
        return EXIT_FAILURE;
    }
    sep = "\n========";
  }
  return 0;
}

void printResult(std::ostream& out, 
                  const scabbard::TraceFile& TF, 
                  const scabbard::verif::StateMachine::Result& res)
{
  using namespace ::scabbard::verif;
  if (res.status == StateMachine::ResultStatus::GOOD) {
    out << res.status;
    return;
  }
  auto printRead = [&]() -> void {
    out << "   READ: {\n" 
           "         time (logical): " << res.read->time_stamp << ",\n"
           "                 device: CPU\n"
           "              thread id: 0x" << std::hex << std::hash<std::thread::id>{}(res.read->threadId.host) << std::dec << "\n"
           "                src loc: \"" << TF.src_files[res.read->metadata.src_id] << ':' << res.read->metadata.line << ',' << res.read->metadata.col << "\"\n"
           "    }\n";
  };
  auto printWrite = [&]() -> void {
    out << "  WRITE: {\n" 
           "    time (logical): " << res.write->time_stamp << ",\n"
           "            device: GPU\n"
           "         thread id: {\n"
           "                   id: {stream: 0x" << std::hex << res.write->threadId.device.job.STREAM << std::dec << ", job#: " << res.write->threadId.device.job.JOB << "},\n"
           "                block: {x:" << res.write->threadId.device.block.x << 
                                  ", y:" << res.write->threadId.device.block.y << 
                                  ", z:"<< res.write->threadId.device.block.z <<"},\n"
           "               thread: {x:" << res.write->threadId.device.thread.x << 
                                    ", y:" << res.write->threadId.device.thread.y << 
                                    ", z:"<< res.write->threadId.device.thread.z <<"}\n"
           "            }\n"
           "           src loc: \"" << TF.src_files[res.write->metadata.src_id] << ':' << res.write->metadata.line << ',' << res.write->metadata.col << "\"\n"
           "    }\n";
  };
  out << " RESULT: `" << res.status << "`\n";
  if (res.err_msg != "")
    out << "MESSAGE: \"" << res.err_msg << "\"\n";
  out << "MEM LOC: 0x" << std::hex << ((res.read) ? res.read->ptr : res.write->ptr) << std::dec << ", {" << res.read->data << "}\n";
  
  if (res.write == nullptr) { //case there is no write data
    printRead();
    out.flush();
    return;
  }
  
  if (res.read->time_stamp > res.write->time_stamp) {
    printWrite();
    printRead();
    out.flush();
    return;
  }

  printRead();
  printWrite();
  out.flush();
                                      
}
