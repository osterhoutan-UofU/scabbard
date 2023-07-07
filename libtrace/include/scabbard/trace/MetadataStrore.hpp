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

#include <scabbard/Metadata.hpp>

namespace scabbard {
namespace trace {

  class MetadataStore {
    //TODO


  public:

    MetadataStore() = default;

    void register_src(std::size_t src_id, const std::string& src_file);
    void unregister_src(std::size_t src_id);
    void register_loc(std::size_t src_id, std::size_t loc_id, std::size_t line, std::size_t col);
    void unregister_loc(std::size_t src_id, std::size_t loc_id);
  };


} //?namespace trace
} //?namespace scabbard