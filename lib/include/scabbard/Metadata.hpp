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

#pragma once

#include "Enums.hpp"

#include <nlohmann/json.hpp>
#include <cstdint>
#include <unordered_set>
#include <cstring>

namespace scabbard {
  
// #pragma pack(1)
//   struct LocationMetadata {
//     std::size_t   src_id;
//     std::uint32_t line;
//     std::uint32_t col;
//     friend inline bool operator == (const LocationMetadata& L, const LocationMetadata& R)
//     {
//       return ( std::memcmp(&L, &R, sizeof(LocationMetadata)) == 0 );
//     }
//   };
// #pragma pack()
  
  struct SrcMetadata {
    std::uint64_t srcID;
    std::string srcFile;
    std::size_t line;
    std::size_t col;
    instr::ModuleType modType;

    inline bool operator < (const SrcMetadata& other) const
    {
      return srcID < other.srcID;
    }

    NLOHMANN_DEFINE_TYPE_INTRUSIVE(SrcMetadata, srcID, srcFile, line, col, modType)
  };

} //?namespace scabbard

// namespace std {

// template<>
// struct hash<scabbard::LocationMetadata> {
//   uint64_t operator () (const scabbard::LocationMetadata& loc) const
//   {
//     return (
//         (std::hash<std::size_t>()(loc.src_id)
//           ^ (std::hash<uint32_t>()(loc.line) << 1u) >> 1u)
//         ^ (std::hash<uint32_t>()(loc.col) << 1u)
//       );
//   }
// };

// } //?namespace std
