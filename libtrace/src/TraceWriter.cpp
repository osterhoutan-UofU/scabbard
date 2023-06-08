/**
 * @file TraceWriter.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief The utility to write the trace files.
 * @version alpha 0.0.1
 * @date 2023-05-30
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include <scabbard/trace/TraceWriter.hpp>
#include <scabbard/version.h>

#include <iostream>


namespace scabbard {
  namespace trace {
  

    const uint32_t TraceWriter::WORD_LEN = __WORDSIZE;
    const std::string _BUF = std::string('\0', __WORDSIZE*2);
    const char* TraceWriter::BUF = _BUF.c_str();

    
    __host__ 
    TraceWriter::TraceWriter(const std::string& file_path)
      : out(file_path, std::ios::out | std::ios::binary | std::ios::trunc) 
    {}

    __host__
    TraceWriter::~TraceWriter()
    {
      if (out.is_open())
        out.close();
    }


    __host__
    void TraceWriter::init(const std::string& executable_path, std::time_t time_stamp)
    {
      if (not out.is_open()) {
        std::cerr << "\n[scabbard::trace::writer::ERROR] could not initiate trace file if it is not open!\n"
                  << std::endl();
        exit(EXIT_FAILURE);
      }
      const uint8_t VER_MAJOR = SCABBARD_VER_MAJOR;
      const uint8_t VER_MINOR = SCABBARD_VER_MINOR;
      const uint8_t VER_PATCH = SCABBARD_VER_PATCH;
      const uint64_t EXE_PATH_LEN = executable_path.size();
      out.write(reinterpret_cast<char*>(&VER_MAJOR), sizeof(uint8_t));
      out.write(reinterpret_cast<char*>(&VER_MINOR), sizeof(uint8_t));
      out.write(reinterpret_cast<char*>(&VER_PATCH), sizeof(uint8_t));
      out.write(reinterpret_cast<char*>(&WORD_LEN), sizeof(uint32_t));
      // make next parameter system word aligned
      out.write(BUF, (sizeof(std::uint8_t)*3+sizeof(uint32_t)) % WORD_LEN); 
      
      // write start time 
      out.write(BUF, sizeof(std::time_t) % WORD_LEN); // little endian buffer
      out.write(reinterpret_cast<char*>(&time_stamp), sizeof(std::time_t));

      // write string of executable file path
      out.write(BUF, sizeof(uint64_t) % WORD_LEN); // little endian buffer
      out.write(reinterpret_cast<char*>(&EXE_PATH_LEN), sizeof(uint64_t));
      out.write(executable_path.c_str(), EXE_PATH_LEN);
      out.write(BUF, EXE_PATH_LEN % WORD_LEN); // string end buffer

      // write links to dynamic lib stuff
      out.write(BUF, WORD_LEN); //TMP record the length of this next section as 0
      //TODO decide how to write this section
    }

    __host__
    void TraceWriter::finalize()
    {
      // currently does nothing
    }

    __host__
    inline void TraceWriter::close()
    {
      if (out.is_open())
        out.close();
    }

    __host__
    inline bool TraceWriter::is_open() const { return out.is_open(); }


    __host__
    inline TraceWriter& operator << (TraceWriter& out, const TraceData& data)
    {
      out.out.write(reinterpret_cast<char*>(&data), sizeof(TraceData));
      if ((sizeof(TraceData) % TraceWriter::WORD_LEN) > 0)
        out.out.wrtie(TraceWriter::BUF, sizeof(TraceData) % TraceWriter::WORD_LEN);
      return out;
    }
    
  
  } //?namespace trace
} //?namespace scabbard