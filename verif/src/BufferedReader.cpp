/**
 * @file BufferedReader.cpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief read from the file in segmented manner removing already seen data as you go 
 *        to keep the overall size of the data structure a limited size.
 * @version alpha 0.0.1
 * @date 2025-04-25
 * 
 * @copyright Copyright (c) 2025
 * 
 */

#include "BufferedReader.hpp"

namespace scabbard {
namespace verif {


template<typename DataTy>
inline BufferedReader<DataTy>::BufferedReader(FileMask* File_, const GetElementFnTy& GetElement_)
  : File(File_), GetElement(GetElement_)
{ 
  init_BUF(); 
}

// template<typename DataTy>
// inline BufferedReader<DataTy>::BufferedReader(FileMask* File_, const GetElementFnTy& GetElement_,
//                                               uint64_t BuffSizeBytes_, size_t ChunkSizeElem_)
//   : File(File_), GetElement(GetElement_), 
//     BuffSizeBytes(BuffSizeBytes_), BuffSizeElem(BuffSizeBytes_ / sizeof(DataTy)),
//     ChunkSizeElem(ChunkSizeElem_), ChunksInBuf((BuffSizeBytes_ / sizeof(DataTy)) / ChunkSizeElem_)
// {
//   if (ChunksInBuf < 5)
//     throw std::domain_error("[scabbard.verif.BufferedReader:ERR] Buffer Size too small or Chunk Size too large");
//   init_BUF(); 
// }

// template<typename DataTy>
// inline BufferedReader<DataTy>::~BufferedReader()
// {
//   File->close();
//   delete File;
// }

// template<typename DataTy>
// inline void BufferedReader<DataTy>::init_BUF()
// {
//   for (size_t i=0ull; i<(ChunksInBuf-2ull) && not File->eof(); i++)
//     read_next_chunk();
// }

// template<typename DataTy>
// inline void BufferedReader<DataTy>::read_next_chunk() 
// {
//   try {
//     for (size_t i=0ull; i<ChunkSizeElem && not File->eof(); ++i) {
//       DataTy* data = new DataTy();
//       GetElement(File, *data);
//       BUF.insert(std::make_shared(data));
//     }
//   } catch (...) {
//     std::throw_with_nested(std::runtime_error("[scabbard.verif.BufferedReader:ERR] An ERROR occurred while reading a new chunk"));
//   }
// }


// Prefix increment
// template<typename DataTy>
// inline typename BufferedReader<DataTy>::iterator& BufferedReader<DataTy>::iterator::operator ++() 
// {
//   iter = parent.BUF.erase(iter);
//   if (0ull == (++(parent.ElemSeen)) % parent.ChunkSizeElem) {
//     parent.read_next_chunk();
//     iter = std::begin(parent.BUF);
//   }
//   return *this; 
// }

// Postfix increment
template<typename DataTy>
inline typename BufferedReader<DataTy>::iterator BufferedReader<DataTy>::iterator::operator ++(int) 
{
  // we remove prev read entries to returning the old one will break things
  throw std::runtime_error("[scabbard.verif.BufferedReader.iterator:DBG_ERR] the postfix increment operator was called!");
  iterator tmp = *this; 
  ++(*this); 
  return tmp; 
} 

} //?namespace verif
} //?namespace scabbard
