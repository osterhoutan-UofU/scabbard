/**
 * @file FileMask.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief A mask for a file that could either be a std::ifstream or a zlib gzFile
 *        but make them both act like a std::ifstream for the purposes of the code. 
 *        Determined at build time with preprocessor argument SCABBARD_USE_COMPRESSION
 * @version alpha 0.0.1
 * @date 2025-04-07
 * 
 */

 #pragma once

#ifdef SCABBARD_USE_COMPRESSION
#include <zlib.h>
#endif
#include <fstream>
#include <stdexcept>



namespace scabbard {
namespace verif {

#ifdef SCABBARD_USE_COMPRESSION

  /**
   * @brief Mask to make Zlib's gzFile work like std::ifStream
   */
  class FileMask {
    gzFile in = NULL;

  public:
    FileMask(const std::string& file_path)
    {
      in = gzopen(file_path, "rb");
      if (in == NULL)
        throw std::runtime_error("Error: ZLIB Could not open file - '" + file_path + "'");
    }

    inline FileMask& read(char* buf, size_t len)
    {
      gzread(in, buf, len);
      return *this;
    }

    inline bool is_open() { return in != NULL; }
    inline bool eof() { return gzeof(in); }
    inline char get() { return gzgetc(in); }


    inline FileMask& seekg(const std::streampos& off)
    {
      gzseek(in, off, SEEK_SET);
      return *this;
    }

    inline std::streampos tellg() { return (std::streampos) gztell(in); }

    inline void close()
    {
      gzclose_r(in);
      in = NULL;
    }
  };

#else // not compressed

  /**
   * @brief Mask for std::ifstream
   */
  class FileMask {
    std::ifstream in;

  public:
    FileMask(const std::string& filepath)
      : in(filepath, std::ios::binary)
    {}

    inline FileMask& read(char* buf, size_t len)
    {
      in.read(buf,len);
      return *this;
    }

    inline bool is_open() { return in.is_open(); }
    inline bool eof() { return in.eof(); }
    inline char get() { return in.get(); }

    inline FileMask& seekg(const std::streampos& pos) 
    {
      in.seekg(pos);
      return *this;
    }

    inline std::streampos tellg() { return in.tellg(); }
    inline void close() { in.close(); }

  };
#endif

} //?namespace verif
} //?namespace scabbard