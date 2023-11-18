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


namespace scabbard {
namespace verif {

#if (__WORDSIZE == 64)
  TraceData readTraceData_32(std::ifstream& in)
  {
    
  }

  TraceData readTraceData_64(std::ifstream& in)
  {

  }
#elif (__WORDSIZE == 32)
  TraceData readTraceData_32(std::ifstream& in)
  {
    
  }

  TraceData readTraceData_64(std::ifstream& in)
  {
    throw std::exception("this binary is compiled in 32 bit, but the trace file has a larger wordsize of 64 bits. This is not supported!");
  }

#else
  std::static_assert(false, "this machine is of an unsupported word size");
#endif


  TraceFile readTraceFile(const std::string& filepath)
  {
    std::ifstream* _input;
    try {
      _input = new std::ifstream(filepath, std::ios::binary);
    } catch (std::exception& ex) {
      std::cerr << "Error occurred while opening trace file: `" << filepath << "`\n    " << ex.what() << std::endl;
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

      // jump if nessisary
      if ((sizeof(uint8_t)*3 + sizeof(uint32_t)) % tf.WORD_LEN)
        //TODO: figure out how to move read head

      // read in the start time
      in.read(reinterpret_cast<char*>(&tf.START_TIME), sizeof(uint32_t));

      // read in exe path
      //TODO: actually read in the exe path

      // based upon trace file decide how to interpret trace data
      std::function<TraceData(std::ifstream)> readTraceData;
      switch (tf.WORD_LEN) {
        case 32u:
          readTraceData = readTraceData_32;
          break;
        case 64u:
          readTraceData = readTraceData_64;
          break;
        default:
          throw std::exception("tracefile comes from a machine with an unsupported wordsize");
      }

      // read in the metadata jump point
      //TODO: read in the metadata jump point
      std::streampos metadata_loc

      // read in the trace data


    } catch (std::exception& ex) {
      std::cerr << "Error occurred while reading in trace file: `" << filepath << "`\n   " << ex.what() << std::endl;
    }
    try {
      _input->close();
    } catch (std::exception& ex) {
      std::cerr << "Error occurred while trying to close the trace file: `" << filepath << "`\n   " << ex.what() << std::endl;
    }
    delete _input;
    return tf;
  }


} //?namespace verif
} //?namespace scabbard
