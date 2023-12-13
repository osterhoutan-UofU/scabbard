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

#include <iostream>
#include <string>


namespace scabbard {
namespace trace {


  std::uint64_t MetadataStore::register_src(const char* _src)
  {
    if (not src_ids) { // deal with issues related to bad linking space
      src_ids = new std::unordered_map<std::string,std::uint64_t>();
      srcs = new std::list<std::string>();
    }
    std::string src_file = std::string(_src);
    auto res = src_ids->find(src_file);
    if (res != src_ids->end())
      return res->second;
    std::uint64_t id = srcs->size();
    // src_ids[src_file] = id;
    src_ids->insert(std::make_pair(src_file, id));
    srcs->emplace_back(std::string(src_file));
    std::cerr << "\n[scabbard:trace:dbg] new src file registered: (`"<< src_file <<"`, "<< id <<")\n" << std::flush;
    return id;
  }

} //?namespace trace
} //?namespace scabbard
