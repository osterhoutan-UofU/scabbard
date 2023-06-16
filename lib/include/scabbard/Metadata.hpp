/**
 * @file Metadata.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief Contents pertaining to Metadata structures scrapped by the scabbard instrument-er
 * @version alpha 0.0.1
 * @date 2023-06-15
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include "Enums.hpp"

#include <cstdint>

namespace scabbard {
  
#pragma pack(1)
  struct LocationMetadata {
    std::size_t   src_id;
    std::uint32_t line;
    std::uint32_t col;
  };
#pragma pack()
  
  struct SourceMetadata {
    LocationMetadata loc;
    instr::ModuleType modType;
    std::string source_file;
  };

} //?namespace scabbard
