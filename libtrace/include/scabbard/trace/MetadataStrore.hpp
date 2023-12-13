/**
 * @file MetadataStore.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief trace runtime metadata structures
 * @version alpha 0.0.1
 * @date 2023-06-15
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#pragma once


#include <string>
#include <cinttypes>
#include <list>
#include <unordered_set>
#include <unordered_map>

namespace scabbard {
namespace trace {

  class MetadataStore {
    
    std::list<std::string>* srcs;
    std::unordered_map<std::string,std::uint64_t>* src_ids;


  public:

    // MetadataStore() = default;
    ~MetadataStore() { delete srcs; delete src_ids; }

    std::uint64_t register_src(const char* _src);

    const std::list<std::string>* get_srcs() const { return srcs; }
  };


} //?namespace trace
} //?namespace scabbard