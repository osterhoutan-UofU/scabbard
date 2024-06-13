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

#pragma once
// trun on hip components when importing from libscabbard
#ifndef __scabbard_hip_compile
# define __scabbard_hip_compile (1u)
#endif
#include <scabbard/TraceData.hpp>

// #include <scabbard/trace/MetadataStrore.hpp>

#include <fstream>
#include <string>
#include <chrono>


namespace scabbard {
  namespace trace {
  

    class TraceWriter {
      
      std::ofstream out;

      // set up binary file setup by the system wordsize
      static const uint32_t WORD_LEN;
      // useful for inserting buffers to realign with system word boundaries
      static const char* BUF;

      std::streampos metadata_table_loc_entry_pos;

    public:

      
       
      __host__ 
      TraceWriter(const std::string& file_path);

      __host__ 
      ~TraceWriter();


      /**
       * @brief after creating this object with the constructor this sets up the header of the
       *        trace file.
       */
      __host__ void init(const std::string& executable_path, 
                          std::time_t time_stamp);

      /**
       * @brief Writes the footer of the trace file \n 
       *        \b NOTE: this must be called after all traces are written \n
       *        \b WARNING: does NOT close the trace file! 
       *        You will have to call \c close() after calling this!
       */
      __host__ void finalize();

      /**
       * @brief closes the trace file on the filesystem
       */
      __host__ void close();

      /**
       * @brief get if the trace file is open on the system or not
       * @return \c bool - if the trace file is open on the filesystem or not
       */
      __host__ inline bool is_open() const;

      friend __host__ inline TraceWriter& operator << (TraceWriter& out, const TraceData& data)
      {
        out.out.write(reinterpret_cast<const char*>(&data), sizeof(TraceData));
        if ((sizeof(TraceData) % TraceWriter::WORD_LEN) > 0)
          out.out.write(TraceWriter::BUF, sizeof(TraceData) % TraceWriter::WORD_LEN);
        return out;
      }
    };
    
  
  } //?namespace trace
} //?namespace scabbard