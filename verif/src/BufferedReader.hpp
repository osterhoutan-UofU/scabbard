/**
 * @file BufferedReader.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief read from the file in segmented manner removing already seen data as you go 
 *        to keep the overall size of the data structure a limited size.
 * @version alpha 0.0.1
 * @date 2025-04-24
 * 
 * @copyright Copyright (c) 2025
 * 
 */

#pragma once

#include "FileMask.hpp"

#include <functional>
#include <memory>
#include <set>

namespace scabbard {
namespace verif {

template<typename DataTy>
struct BufferedReader {

  static constexpr uint64_t _BuffSizeBytes  = 2'048'000'000ull;
  static constexpr size_t   _BuffSizeElem   = (size_t) _BuffSizeBytes / sizeof(DataTy);
  static constexpr size_t   _ChunkSizeElem  = 32'768ull;
  static constexpr size_t   _ChunksInBuf    = (size_t) _BuffSizeElem / _ChunkSizeElem;

  static_assert(_BuffSizeElem >= 5ull, "[scabbard.verif:ERR] the buffer needs to be big enough to support at least 5 chunks!");

  using GetElementFnTy = std::function<void(FileMask&,DataTy&)>;

  FileMask* File;
  const GetElementFnTy& GetElement;
  const uint64_t        BuffSizeBytes = _BuffSizeBytes;
  const size_t          BuffSizeElem  = _BuffSizeElem;
  const size_t          ChunkSizeElem = _ChunkSizeElem;
  const size_t          ChunksInBuf   = _ChunksInBuf;

  using ElementTy = std::shared_ptr<const DataTy>;
  using Container = std::set<ElementTy>;

  Container BUF;

  BufferedReader() = delete;
  BufferedReader(FileMask* File_, const GetElementFnTy& GetElement_);
  BufferedReader(FileMask* File_, const GetElementFnTy& GetElement_,
                  uint64_t BuffSizeBytes_, size_t ChunkSizeElem_ = _ChunkSizeElem)
    : File(File_), GetElement(GetElement_), 
      BuffSizeBytes(BuffSizeBytes_), BuffSizeElem(BuffSizeBytes_ / sizeof(DataTy)),
      ChunkSizeElem(ChunkSizeElem_), ChunksInBuf((BuffSizeBytes_ / sizeof(DataTy)) / ChunkSizeElem_)
  {
    if (ChunksInBuf < 5)
      throw std::domain_error("[scabbard.verif.BufferedReader:ERR] Buffer Size too small or Chunk Size too large");
    init_BUF(); 
  }
  ~BufferedReader()
  {
    File->close();
    delete File;
  }

  struct iterator 
  {
    using iterator_category = std::forward_iterator_tag;
    using pointer           = const ElementTy*;
    using reference         = const ElementTy&;

    iterator(typename Container::iterator iter_, BufferedReader<DataTy>& parent_) : iter(iter_), parent(parent_) {}

    inline reference operator *() const { return *iter; }
    inline pointer operator ->() const { return &*iter; }

    // Prefix increment
    inline iterator& operator ++()
    {
      iter = parent.BUF.erase(iter);
      if (0ull == (++(parent.ElemSeen)) % parent.ChunkSizeElem) {
        parent.read_next_chunk();
        iter = std::begin(parent.BUF);
      }
      return *this; 
    }

    // Postfix increment
    inline iterator operator ++(int);

    friend bool operator == (const iterator& a, const iterator& b) 
    { return a.iter == b.iter; };
    friend bool operator != (const iterator& a, const iterator& b) 
    { return a.iter != b.iter; };

  private:
    typename Container::iterator iter;
    BufferedReader<DataTy>& parent;
  };

  inline iterator begin() { return iterator(std::begin(BUF), *this); }
  inline iterator end() { return iterator(std::end(BUF), *this); }

private:
  size_t ElemSeen = 0ull;


  inline void init_BUF()
  {
    for (size_t i=0ull; i<(ChunksInBuf-2ull) && not File->eof(); i++)
      read_next_chunk();
  }

  inline void read_next_chunk()
  {
    try {
      for (size_t i=0ull; i<ChunkSizeElem && not File->eof(); ++i) {
        DataTy* data = new DataTy();
        GetElement(*File, *data);
        BUF.insert(std::make_shared<const DataTy>(data));
      }
    } catch (...) {
      std::throw_with_nested(std::runtime_error("[scabbard.verif.BufferedReader:ERR] An ERROR occurred while reading a new chunk"));
    }
  }
  
};

} //?namespace verif
} //?namespace scabbard