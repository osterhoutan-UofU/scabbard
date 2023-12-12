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

#include <hip/hip_ext.h>
#include <hip/hip_runtime_api.h>

#include <iostream>


namespace scabbard {
  namespace trace {
  

    const uint32_t TraceWriter::WORD_LEN = __WORDSIZE / 8;
    const std::string _BUF = std::string(__WORDSIZE*4, '\0');
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
    void TraceWriter::init(const std::string& executable_path, std::time_t time_stamp, const MetadataStore& metadata)
    {
      if (not out.is_open()) {
        std::cerr << "\n[scabbard::trace::writer::ERROR] could not initiate trace file if it is not open!\n"
                  << std::endl;
        exit(EXIT_FAILURE);
      }
      const uint8_t VER_MAJOR = SCABBARD_VER_MAJOR;
      const uint8_t VER_MINOR = SCABBARD_VER_MINOR;
      const uint8_t VER_PATCH = SCABBARD_VER_PATCH;
      const uint64_t EXE_PATH_LEN = executable_path.size();
      out.write(reinterpret_cast<const char*>(&VER_MAJOR), sizeof(uint8_t));
      out.write(reinterpret_cast<const char*>(&VER_MINOR), sizeof(uint8_t));
      out.write(reinterpret_cast<const char*>(&VER_PATCH), sizeof(uint8_t));
      out.write(reinterpret_cast<const char*>(&WORD_LEN), sizeof(uint32_t));
      // make next parameter system word aligned
      out.write(BUF, 9ul); 
      
      // write start time 
      out.write(reinterpret_cast<const char*>(&time_stamp), sizeof(std::uint32_t));
      out.write(BUF, 12ul); // little endian buffer

      // write string of executable file path
      out.write(reinterpret_cast<const char*>(&EXE_PATH_LEN), sizeof(uint64_t));
      out.write(executable_path.c_str(), EXE_PATH_LEN);
      out.write(BUF, EXE_PATH_LEN % WORD_LEN); // string end buffer

      // write links to metadata table and end of trace table (recorded in finalize)
      const auto& srcs = *metadata.get_srcs();
      // record the jump table for the source files
      assert((sizeof(std::streamoff) == WORD_LEN) && "stream offset is the right size to be written");
      std::streamoff pos = ((std::streamoff)out.tellp()) + (std::streamoff)(WORD_LEN*(srcs.size()+1));
      out.write(reinterpret_cast<const char*>(&pos), WORD_LEN);
      for (const auto& src : srcs) {
        pos += (std::streamoff)src.size();
        out.write(reinterpret_cast<const char*>(&pos), WORD_LEN);
      }
      out.write(BUF,WORD_LEN); // write end of table null
      // record the actual src strings
      for (const auto& src : srcs)
        out.write(src.c_str(), src.size());
      out.write(BUF, ((std::streamoff)out.tellp()) % WORD_LEN); // word align for next section
      
    }

    __host__
    void TraceWriter::finalize(const MetadataStore& metadata)
    {
      // std::streamoff trace_end = out.tellp();
      // const auto& srcs = *metadata.get_srcs();
      // // record the jump table for the source files
      // assert((sizeof(std::streamoff) == WORD_LEN) && "stream offset is the right size to be written");
      // std::streamoff pos = trace_end + (std::streamoff)(WORD_LEN*(srcs.size()+1));
      // out.write(reinterpret_cast<const char*>(&pos), WORD_LEN);
      // for (const auto& src : srcs) {
      //   pos += (std::streamoff)src.size();
      //   out.write(reinterpret_cast<const char*>(&pos), WORD_LEN);
      // }
      // out.write(BUF,WORD_LEN); // write end of table null
      // // record the actual src strings
      // for (const auto& src : srcs)
      //   out.write(src.c_str(), src.size());
      // out.write(BUF,WORD_LEN); // write end of file null
      // std::streampos eof = out.tellp(); // record eof loc
      // go write the jump location of the metadata table
      // out.seekp(metadata_table_loc_entry_pos);
      // out.write(reinterpret_cast<const char*>(&trace_end), WORD_LEN);
      // return to eof
      // out.seekp(eof);
    }

    __host__
    void TraceWriter::close()
    {
      if (out.is_open())
        out.close();
    }

    __host__
    inline bool TraceWriter::is_open() const { return out.is_open(); }


    // __host__
    // inline TraceWriter& operator << (TraceWriter& out, const TraceData& data)
    // {
    //   out.out.write(reinterpret_cast<const char*>(&data), sizeof(TraceData));
    //   if ((sizeof(TraceData) % TraceWriter::WORD_LEN) > 0)
    //     out.out.write(TraceWriter::BUF, sizeof(TraceData) % TraceWriter::WORD_LEN);
    //   return out;
    // }
    
  
  } //?namespace trace
} //?namespace scabbard