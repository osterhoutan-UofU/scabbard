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


#ifdef SCABBARD_USE_COMPRESSION

    [[clang::disable_sanitizer_instrumentation, gnu::used, gnu::retain]] 
    __host__
    TraceWriter::TraceWriter(const std::string& file_path)
    {
      out = gzopen(file_path, "wb" SCABBARD_USE_COMPRESSION);
    }

    [[clang::disable_sanitizer_instrumentation, gnu::used, gnu::retain]] 
    __host__
    TraceWriter::~TraceWriter()
    {
      if (is_open())
        close();
    }

    [[clang::disable_sanitizer_instrumentation, gnu::used, gnu::retain]] 
    __host__ 
    inline void TraceWriter::write(const char* Content, size_t Size) { gzwrite(out, Content, Size); }

    [[clang::disable_sanitizer_instrumentation, gnu::used, gnu::retain]] 
    __host__
    void TraceWriter::close()
    {
      if (is_open())
        gzclose_w(out);
      out = NULL;
    }

    [[clang::disable_sanitizer_instrumentation, gnu::used, gnu::retain]] 
    __host__
    inline bool TraceWriter::is_open() const { return out != NULL; }


#else // no compression used

    [[clang::disable_sanitizer_instrumentation, gnu::used, gnu::retain]] 
    __host__
    TraceWriter::TraceWriter(const std::string& file_path)
      : out(file_path, std::ios::out | std::ios::binary | std::ios::trunc) 
    {}

    [[clang::disable_sanitizer_instrumentation, gnu::used, gnu::retain]] 
    __host__
    TraceWriter::~TraceWriter()
    {
      if (out.is_open())
        out.close();
    }

    [[clang::disable_sanitizer_instrumentation, gnu::used, gnu::retain]] 
    __host__ 
    inline void TraceWriter::write(const char* Content, size_t Size) { out.write(Content, Size); }

    [[clang::disable_sanitizer_instrumentation, gnu::used, gnu::retain]] 
    __host__
    void TraceWriter::close()
    {
      if (out.is_open())
        out.close();
    }

    [[clang::disable_sanitizer_instrumentation, gnu::used, gnu::retain]] 
    __host__
    inline bool TraceWriter::is_open() const { return out.is_open(); }

#endif


    [[clang::disable_sanitizer_instrumentation, gnu::used, gnu::retain]] 
    __host__
    void TraceWriter::init(const std::string& executable_path, std::time_t time_stamp)
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
      write(reinterpret_cast<const char*>(&VER_MAJOR), sizeof(uint8_t));
      write(reinterpret_cast<const char*>(&VER_MINOR), sizeof(uint8_t));
      write(reinterpret_cast<const char*>(&VER_PATCH), sizeof(uint8_t));
      write(reinterpret_cast<const char*>(&WORD_LEN), sizeof(uint32_t));
      // make next parameter system word aligned
      write(BUF, 9ul); 
      
      // write start time 
      write(reinterpret_cast<const char*>(&time_stamp), sizeof(std::uint32_t));
      write(BUF, 12ul); // little endian buffer

      // write string of executable file path
      write(reinterpret_cast<const char*>(&EXE_PATH_LEN), sizeof(uint64_t));
      write(executable_path.c_str(), EXE_PATH_LEN);
      write(BUF, EXE_PATH_LEN % WORD_LEN); // string end buffer

      // // write links to metadata table and end of trace table (recorded in finalize)
      // const auto& srcs = *metadata.get_srcs();
      // std::cerr << "\n[scabbard:trace:dbg] src's registered at this point: " << srcs.size() << std::endl;
      // // record number of entries in the table
      // uint64_t num_buf = srcs.size();
      // write(reinterpret_cast<const char*>(&num_buf), sizeof(uint64_t));
      // for (auto src : srcs) {
      //   num_buf = src.size()+1;
      //   write(reinterpret_cast<const char*>(&num_buf), sizeof(uint64_t));
      //   write(src.c_str(), src.size());
      //   write(BUF, 1ul); // write null at end of string for separation
      // }
      // write(BUF, ((std::streamoff)out.tellp()) % WORD_LEN); // word align for next section

      // // record the jump table for the source files
      // assert((sizeof(std::streamoff) == WORD_LEN) && "stream offset is the right size to be written");
      // std::streamoff pos = ((std::streamoff)out.tellp()) + (std::streamoff)(WORD_LEN*(srcs.size()+1));
      // write(reinterpret_cast<const char*>(&pos), WORD_LEN);
      // for (const auto& src : srcs) {
      //   pos += (std::streamoff)src.size();
      //   write(reinterpret_cast<const char*>(&pos), WORD_LEN);
      // }
      // write(BUF,WORD_LEN); // write end of table null
      // // record the actual src strings
      // for (const auto& src : srcs) {
      //   write(src.c_str(), src.size());
      //   std::cerr << "\n[scabbard:trace:dbg] encoding src file: `" << src << "`\n";
      // }
      // std::cerr << std::endl;
      // write(BUF, ((std::streamoff)out.tellp()) % WORD_LEN); // word align for next section
      
    }

    [[clang::disable_sanitizer_instrumentation, gnu::used, gnu::retain]] 
    __host__
    void TraceWriter::finalize() {}


    __host__ TraceWriter& operator << (TraceWriter& out, const TraceData& data)
    {
      out.write(reinterpret_cast<const char*>(&data), sizeof(TraceData));
      if ((sizeof(TraceData) % TraceWriter::WORD_LEN) > 0)
        out.write(TraceWriter::BUF, sizeof(TraceData) % TraceWriter::WORD_LEN);
      return out;
    }
    
  
  } //?namespace trace
} //?namespace scabbard