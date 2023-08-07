/**
 * @file MetadataStore.cpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief trace runtime metadata structures
 * @version alpha 0.0.1
 * @date 2023-06-15
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include "scabbard/trace/MetadataStrore.hpp"


namespace scabbard {
namespace trace {


  std::uint64_t MetadataStore::register_src(const char* _src)
  {
    std::string src_file = std::string(_src);
    auto res = src_ids.find(src_file);
    if (res != src_ids.end())
      return res->second;
    std::uint64_t id = srcs.size();
    // src_ids[src_file] = id;
    if (src_ids.size() <= 0) // deal with issues related to bad linking space
      src_ids = std::unordered_map<std::string,std::uint64_t>();
    src_ids.insert(std::make_pair(src_file, id));
    srcs.push_back(src_file);
    return id;
  }

} //?namespace trace
} //?namespace scabbard
