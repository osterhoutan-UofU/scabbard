/**
 * @file MetadataIO.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief provide utils for reading and writing metadata to the metadata file
 * @version alpha 0.0.1
 * @date 2024-06-04
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#pragma once

#include "Metadata.hpp"


#include <vector>
#include <map>
#include <string>

namespace scabbard {

  typedef std::map<std::uint64_t,SrcMetadata> MetadataJSONFile_t;

  MetadataJSONFile_t read_metadata_file(const std::string& filepath);

  void write_metadata_file(const std::string& filepath, const MetadataJSONFile_t& contents);


} //?namespace scabbard
