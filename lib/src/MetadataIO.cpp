/**
 * @file MetadataIO.cpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief provide utils for reading and writing metadata to the metadata file
 * @version alpha 0.0.1
 * @date 2024-06-04
 * 
 * @copyright Copyright (c) 2024
 * 
 */

#include <scabbard/MetadataIO.hpp>

#include <nlohmann/json.hpp>

#include <fstream>
#include <iostream>
#include <sstream>

namespace scabbard {


std::string to_string(const SrcMetadata& meta)
{
  std::stringstream out;
  out << '[' << meta.modType << "] \"" << meta.srcFile << ':' << meta.line << ',' << meta.col << "\"";
  return out.str();
}


// << ------------------------------------------------------------------------------------------ >> 


MetadataJSONFile_t read_metadata_file(const std::string& filepath)
{
  using json = nlohmann::json;

  std::ifstream* _input;
  try {
    _input = new std::ifstream(filepath, std::ios::in);
  } catch (std::exception ex) {
    std::cerr << "\n[scabbard.lib.meta:ERR] could not open metadata file (`" << filepath <<"`) to read from it!" 
                 "\n[scabbard.lib.meta:ERR]   error msg: `" << ex.what() << "`\n"  << std::flush;
    exit(EXIT_FAILURE);
  } catch (...) {
    std::cerr << "\n[scabbard.lib.meta:ERR] could not open metadata file (`" << filepath <<"`) to read from it!" 
                 "\n[scabbard.lib.meta:ERR]   error msg: `<UNKNOWN_ERROR>`\n"  << std::flush;
    exit(EXIT_FAILURE);
  }
  json data;
  try {
    data = json::parse(*_input);
  } catch (std::exception ex) {
    std::cerr << "\n[scabbard.lib.meta:ERR] error reading file!" 
                 "\n[scabbard.lib.meta:ERR]        file: \"" << filepath <<"\"" 
                 "\n[scabbard.lib.meta:ERR]   error msg: `" << ex.what() << "`\n"  << std::flush;
    _input->close();
    exit(EXIT_FAILURE);
  } catch (...) {
    std::cerr << "\n[scabbard.lib.meta:ERR] error reading file!" 
                 "\n[scabbard.lib.meta:ERR]        file: \"" << filepath <<"\"" 
                 "\n[scabbard.lib.meta:ERR]   error msg: `<UNKOWN_ERROR>`\n" << std::flush;
    _input->close();
    exit(EXIT_FAILURE);
  }
  _input->close();

  MetadataJSONFile_t metadata;
  for (auto entry : data) {
    SrcMetadata meta;
    try {
      from_json(entry, meta);
    } catch (std::exception ex) {
      std::cerr << "\n[scabbard.lib.meta:ERR] could not convert JSON to SrcMetadata struct!" 
                   "\n[scabbard.lib.meta:ERR]   error msg: `" << ex.what() << "`\n" <<
                   "\n[scabbard.lib.meta:ERR]        json: `" << entry << "`\n" << std::flush;
      exit(EXIT_FAILURE);
    } catch (...) {
      std::cerr << "\n[scabbard.lib.meta:ERR] could not convert JSON to SrcMetadata struct!" 
                   "\n[scabbard.lib.meta:ERR]   error msg: `<UNKOWN_ERROR>`\n" <<
                   "\n[scabbard.lib.meta:ERR]        json: `" << entry << "`\n" << std::flush;
      exit(EXIT_FAILURE);
    }
    metadata.insert(std::make_pair(meta.srcID,meta));
  }
  return metadata;
}



void write_metadata_file(const std::string& filepath, const MetadataJSONFile_t& contents)
{
  using json = nlohmann::json;

  std::ofstream* _output;
  try {
    _output = new std::ofstream(filepath, std::ios::out | std::ios::trunc);
  } catch (std::exception ex) {
    std::cerr << "\n[scabbard.lib.meta:ERR] could not open metadata file (`" << filepath <<"`) to write to it!" 
                 "\n[scabbard.lib.meta:ERR]   error msg: `" << ex.what() << "`\n"  << std::flush;
    exit(EXIT_FAILURE);
  } catch (...) {
    std::cerr << "\n[scabbard.lib.meta:ERR] could not open metadata file (`" << filepath <<"`) to write to it!" 
                 "\n[scabbard.lib.meta:ERR]   error msg: `<UNKNOWN_ERROR>`\n"  << std::flush;
    exit(EXIT_FAILURE);
  }

  try {
    *_output << '[';
    std::string sep = "";
    for (const auto entry : contents) {
      json data;
      to_json(data,entry.second);
      *_output << sep << data << std::flush;
      sep = ",\n  ";
    }
    *_output << "\n]\n" << std::flush;
  } catch (std::exception ex) {
    std::cerr << "\n[scabbard.lib.meta:ERR] error writing to file!" 
                 "\n[scabbard.lib.meta:ERR]        file: \"" << filepath <<"\"" 
                 "\n[scabbard.lib.meta:ERR]   error msg: `" << ex.what() << "`\n"  << std::flush;
    exit(EXIT_FAILURE);
  } catch (...) {
    std::cerr << "\n[scabbard.lib.meta:ERR] error writing to file!" 
                 "\n[scabbard.lib.meta:ERR]        file: \"" << filepath <<"\"" 
                 "\n[scabbard.lib.meta:ERR]   error msg: `<UNKOWN_ERROR>`\n" << std::flush;
    exit(EXIT_FAILURE);
  }
  _output->close();
}

} //?namespace scabbard
