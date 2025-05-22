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
#include <cstdlib>
#include <mutex>
#include <deque>
#include <queue>
#include <thread>
#include <chrono>


static void printResult(std::ostream& out,
                  const scabbard::MetadataJSONFile_t& MF,
                  const scabbard::verif::StateMachine::Result& res);

using GetTraceFileTy = std::function<scabbard::verif::TraceFile(std::string)>; 
static GetTraceFileTy create_TraceFile_creator(const size_t THREADS);

static void run_multithreaded(const int argc, char* argv[], const size_t THREADS, scabbard::verif::StateMachine::Results& res, GetTraceFileTy& get_TraceFile);
static void run_single_threaded(const int argc, char* argv[], scabbard::verif::StateMachine::Results& res, GetTraceFileTy& get_TraceFile);


// << ------------------------------------------------------------------------------------------ >> 


int main(int argc, char *argv[]) {
  using namespace ::scabbard::verif;
  if (argc < 3) {
    std::cerr << "incorrect input provided, please provide a file path to a scabbard metadata file "
                 "AND to some number of scabbard trace files (in that order) (wildcard/glob notation accepted for trace files)"
              << std::endl;
    exit(EXIT_FAILURE);
  }

  const char* _THREADS = std::getenv("SCABBARD_VERIF_THREAD_COUNT");

  size_t _threads = ((_THREADS)
                    ? std::stoull(_THREADS) // trusting the python front end to check that this will not fail to convert str to int
                    : 1ull);
  const size_t THREADS = ((_threads >= std::thread::hardware_concurrency()) //prevent from using more threads than available
                            ? std::thread::hardware_concurrency()-1ull
                            : _threads);

  auto mf = scabbard::read_metadata_file(std::string(argv[1]));
  GetTraceFileTy get_TraceFile = create_TraceFile_creator(THREADS);
  StateMachine::Results results = {};

  if (THREADS > 1)
    run_multithreaded(argc, argv, THREADS, results, get_TraceFile);
  else
    run_single_threaded(argc, argv, results, get_TraceFile);
  

  std::string sep = "";
  for (auto result : results) {
    std::cout << sep; 
    switch (result.first.status)
    {
      case StateMachine::ResultStatus::ERROR:
        std::cout << '\n' << result.second << "x DATA RACE(S) were detected; deriving from the src locations detailed in the sampled event below!\n";
        printResult(std::cout, mf, result.first);
        break;

      case StateMachine::ResultStatus::WARNING:
        std::cout << '\n' << result.second << "x POSSIBLE data race(s) were detected; deriving from the src locations detailed in the sampled event below!\n";
        printResult(std::cout, mf, result.first);
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

// << ------------------------------------------------------------------------------------------ >> 

static void printResult(std::ostream& out, 
                  const scabbard::MetadataJSONFile_t& MF,
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


// << ------------------------------------------------------------------------------------------ >> 


static void run_single_threaded(const int argc, char* argv[], scabbard::verif::StateMachine::Results& res, GetTraceFileTy& get_TraceFile)
{
  using namespace scabbard::verif;
  for (size_t i=2ull; i<argc; ++i)
    for (auto path : glob::glob(argv[i])) {
      auto tf = get_TraceFile(path.string());
      scabbard::verif::StateMachine sm(tf);
      sm.run(res);
    }
}

static void merge_results(scabbard::verif::StateMachine::Results& res, const scabbard::verif::StateMachine::Results to_add)
{
  for (const auto& [key,count] : to_add) {
    auto it = res.find(key);
    if (it != res.end())
      it->second += count;
    else
      res[key] = count;
  }
}

static void run_multithreaded(const int argc, char* argv[], const size_t THREADS, scabbard::verif::StateMachine::Results& res, GetTraceFileTy& get_TraceFile)
{
  using namespace scabbard::verif;
  std::mutex mxIn, mxOut;
  std::deque<std::filesystem::path> input;
  std::deque<StateMachine::Results*> output;
  StateMachine::Results outputs[THREADS];
  
  for (size_t i=2ull; i<argc; ++i) {
    for (auto& path : glob::glob(argv[i]))
      input.push_back(path);
  }
  
  auto work = [&](StateMachine::Results& tRes) -> void {
    mxIn.lock();
    while (input.size() > 0) {
      auto path = input.front();
      input.pop_front();
      mxIn.unlock();
      auto tf = get_TraceFile(path.string());
      scabbard::verif::StateMachine sm(tf);
      sm.run(tRes);
      mxIn.lock();
    }
    mxIn.unlock();
    mxOut.lock();
    output.push_back(&tRes);
    mxOut.unlock();
  };

  std::vector<std::thread> threads(THREADS);

  for (size_t i=0ull; i<THREADS; ++i)
    threads.emplace_back(std::thread(work, std::ref(outputs[i])));

  size_t seen = 0ull;
  const std::chrono::milliseconds DELAY(20ull);

  do {
    mxOut.lock();
    if (output.size() > 0ull) {
      auto oRes = output.front();
      output.pop_front();
      mxOut.unlock();
      merge_results(res, *oRes);
      ++seen;
    } else {
      mxOut.unlock();
      std::this_thread::sleep_for(DELAY);
    }
  } while (seen < THREADS);

  for (auto& t : threads)
    t.join();
}


// << ------------------------------------------------------------------------------------------ >> 


GetTraceFileTy create_TraceFile_creator(const size_t THREADS) 
{
  using namespace scabbard::verif;
  const char* _MEM_LIMIT = std::getenv("SCABBARD_VERIF_MEM_LIMIT_BYTES");
  const char* _CHUNK_SIZE = std::getenv("SCABBARD_VERIF_CHUNK_SIZE");

  size_t opts = 0ull;

  if (_MEM_LIMIT != nullptr)  opts |= 0b01ull;
  if (_CHUNK_SIZE != nullptr) opts |= 0b10ull;

  switch (opts)
  {
  case 0b00ull: // case neither option specified
    return [](std::string filepath) -> TraceFile { return readTraceFile(filepath); };
  case 0b01ull: { // case just mem limit specified
    const uint64_t MEM_LIMIT_BYTES = std::stoull(_MEM_LIMIT); // trusting python frontend to validate input
    const uint64_t BUF_SIZE_BYTES = MEM_LIMIT_BYTES / THREADS;
    const size_t BUF_SIZE_ELEM = BUF_SIZE_BYTES / sizeof(scabbard::TraceData);
    const size_t CHUNK_SIZE_ELEM = BufferedReader<scabbard::TraceData>::_ChunkSizeElem;
    const size_t CHUNKS_IN_BUF = BUF_SIZE_ELEM / CHUNK_SIZE_ELEM;
    if (CHUNKS_IN_BUF < 5) { // handle bad input error
      std::cerr << "[scabbard.verif:ERR] BAD INPUT: the memory limit is not big enough" 
                << std::string((THREADS>1) ? " for the thread count" : "") 
                <<" (min=" 
                << (CHUNK_SIZE_ELEM*sizeof(scabbard::TraceData)*5*THREADS)/1'000ull
                << "kBytes)" << std::endl;
      exit(EXIT_FAILURE);
    }
    return [=](std::string filepath) -> TraceFile { return readTraceFile(filepath, BUF_SIZE_BYTES); };
  }
  case 0b10ull: { // case just chunk size specified
    const uint64_t BUF_SIZE_BYTES = BufferedReader<scabbard::TraceData>::_BuffSizeBytes;
    const size_t BUF_SIZE_ELEM = BUF_SIZE_BYTES / sizeof(scabbard::TraceData);
    const size_t CHUNK_SIZE_ELEM = std::stoull(_CHUNK_SIZE); // trusting python front end to validate input
    const size_t CHUNKS_IN_BUF = BUF_SIZE_ELEM / BufferedReader<scabbard::TraceData>::_ChunkSizeElem;
    if (CHUNKS_IN_BUF < 5) { // handle bad input error
      std::cerr << "[scabbard.verif:ERR] BAD INPUT: the memory limit is not big enough for the provided chunk size!" << std::endl;
      exit(EXIT_FAILURE);
    }
    return [=](std::string filepath) -> TraceFile { return readTraceFile(filepath, BUF_SIZE_BYTES, CHUNK_SIZE_ELEM); };
  }
  case 0b11ull: { // case both specified
    const uint64_t MEM_LIMIT_BYTES = std::stoull(_MEM_LIMIT); // trusting python frontend to validate input
    const uint64_t BUF_SIZE_BYTES = MEM_LIMIT_BYTES / THREADS;
    const size_t BUF_SIZE_ELEM = BUF_SIZE_BYTES / sizeof(scabbard::TraceData);
    const size_t CHUNK_SIZE_ELEM = std::stoull(_CHUNK_SIZE); // trusting python front end to validate input
    const size_t CHUNKS_IN_BUF = BUF_SIZE_ELEM / CHUNK_SIZE_ELEM;
    if (CHUNKS_IN_BUF < 5) { // handle bad input error
      std::cerr << "[scabbard.verif:ERR] BAD INPUT: the memory limit is not big enough for the provided chunk size"
                << std::string((THREADS>1) ? " and thread count" : "") 
                << " (min=" 
                << (CHUNK_SIZE_ELEM*sizeof(scabbard::TraceData)*5)/1'000ull
                << "kBytes)" << std::endl;
      exit(EXIT_FAILURE);
    }
    return [=](std::string filepath) -> TraceFile { return readTraceFile(filepath, BUF_SIZE_BYTES, CHUNK_SIZE_ELEM); };
  }
  default:
    std::cerr << "[scabbard.verif:DBG_ERR] failed to parse env options!" << std::endl;
    exit(EXIT_FAILURE);
    break;
  }

}
