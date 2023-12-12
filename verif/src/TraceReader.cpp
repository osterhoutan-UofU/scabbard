/**
 * @file TraceReader.cpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief A class object that reads in a scabbard trace file
 * @version alpha 0.0.1
 * @date 2023-11-17
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include "TraceReader.hpp"

#include <fstream>
#include <iostream>
#include <memory>

#define BUF_L (128ul)

namespace scabbard {
namespace verif {

#if (__WORDSIZE == 64)
  TraceData readTraceData_32(std::ifstream& in)
  {
    TraceData res;
    in.read(reinterpret_cast<char*>(&res.time_stamp), sizeof(uint32_t));
    in.read(reinterpret_cast<char*>(&res.data), sizeof(InstrData));
    in.read(reinterpret_cast<char*>(&res.threadId), sizeof(ThreadId));
    in.read(reinterpret_cast<char*>(&res.ptr), sizeof(uint32_t));
    in.read(reinterpret_cast<char*>(&res.metadata), 12u);
    in.read(reinterpret_cast<char*>(&res._OPT_DATA), sizeof(uint32_t));
    return res;
  }

  TraceData readTraceData_64(std::ifstream& in)
  {
    TraceData res;
    in.read(reinterpret_cast<char*>(&res), sizeof(TraceData));
    return res;
  }
#elif (__WORDSIZE == 32)
  TraceData readTraceData_32(std::ifstream& in)
  {
    TraceData res;
    in.read(reinterpret_cast<char*>(&res), sizeof(TraceData));
    return res;
  }

  TraceData readTraceData_64(std::ifstream& in)
  {
    throw std::exception("this binary is compiled in 32 bit, but the trace file has a larger wordsize of 64 bits. This is not supported!");
  }

#else
  std::static_assert(false, "this machine is of an unsupported word size");
#endif

  std::string readStringL(std::ifstream& in, std::streamoff l)
  {
    char buf[BUF_L];
    std::string tmp = "";
    std::streamoff J = l / BUF_L;
    for (size_t j=0; j<J; ++j) {
      in.read(buf, BUF_L);
      tmp.append(buf, BUF_L);
    }
    std::streamoff K = l % BUF_L;
    in.read(buf,K);
    tmp.append(buf,K);
    return tmp;
  }


  TraceFile readTraceFile(const std::string& filepath)
  {
    std::ifstream* _input;
    try {
      _input = new std::ifstream(filepath, std::ios::binary);
    } catch (std::exception& ex) {
      std::cerr << "Error occurred while opening trace file: `" << filepath << "`\n    " << ex.what() << std::endl;
      exit(EXIT_FAILURE);
    }
    std::ifstream& in = *_input;
    TraceFile tf;

    try {
      // read in the version identifiers
      in.read(reinterpret_cast<char*>(&tf.VER_MAJOR), sizeof(uint8_t));
      in.read(reinterpret_cast<char*>(&tf.VER_MINOR), sizeof(uint8_t));
      in.read(reinterpret_cast<char*>(&tf.VER_PATCH), sizeof(uint8_t));

      // read in the writing system's word size
      in.read(reinterpret_cast<char*>(&tf.WORD_LEN), sizeof(uint32_t));

      in.seekg(((std::streamoff)in.tellg()) + 9ul);

      // read in the start time
      in.read(reinterpret_cast<char*>(&tf.START_TIME), sizeof(uint32_t));
      in.seekg(((std::streamoff)in.tellg()) + 12ul);

      // read in exe path
      std::size_t exe_l = 0ul;
      in.read(reinterpret_cast<char*>(&exe_l), tf.WORD_LEN);
      tf.EXE_PATH = readStringL(in, exe_l);
      if (std::streamoff diff2 = exe_l % tf.WORD_LEN)
        in.seekg(in.tellg() + diff2);

      // read in the metadata jump table
      std::vector<std::streamoff> jmpTbl;
      std::streamoff tmp;
      do {
        in.read(reinterpret_cast<char*>(&tmp), tf.WORD_LEN);
        jmpTbl.push_back(tmp);
      } while (in.tellg() < jmpTbl[0]);

      // read in the metadata
      for (size_t i=0; i<(jmpTbl.size()-1); ++i) {
        in.seekg(jmpTbl[i]);
        std::streamoff l = jmpTbl[i+1] - jmpTbl[i];
        tf.src_files.push_back(readStringL(in,l));
      }
      if (std::streamoff diff3 = in.tellg() % tf.WORD_LEN)
        in.seekg(in.tellg() + diff3);

      // based upon trace file decide how to interpret trace data
      std::function<TraceData(std::ifstream&)> readTraceData;
      switch (tf.WORD_LEN) {
        case 32u:
          readTraceData = readTraceData_32;
          break;
        case 64u:
          readTraceData = readTraceData_64;
          break;
        default:
          throw std::domain_error("tracefile comes from a machine with an unsupported wordsize");
      }

      // read in the metadata jump point
      std::streamoff trace_end_pos;
      in.read(reinterpret_cast<char*>(&trace_end_pos), tf.WORD_LEN);

      // read in the trace data
      while (trace_end_pos < in.tellg())
        tf.trace_data.insert(readTraceData(in));

    } catch (std::exception& ex) {
      std::cerr << "Error occurred while reading in trace file: `" << filepath << "`\n   " << ex.what() << std::endl;
      exit(EXIT_FAILURE);
    }
    try {
      _input->close();
    } catch (std::exception& ex) {
      std::cerr << "WARNING: error occurred while trying to close the trace file: `" << filepath << "`\n   " << ex.what() << std::endl;
    }
    delete _input;
    return tf;
  }


} //?namespace verif
} //?namespace scabbard
