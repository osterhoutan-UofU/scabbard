/**
 * @file SplittingIntervalMap.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief This is an interval map that is designed to hold the minimum number of copies of its data,
 *         and still support splitting (in an overwrite fashion) the intervals at insertion time, 
 *         and collessing neighboring intervals.
 *        Requires that the key type be comparable, and the value type be assignable.
 * @version 1.0.0
 * @date 2025-06-04
 * 
 * @copyright Copyright (c) 2025
 * 
 */

#ifndef OSTER_SPLITTING_INTERVAL_MAP_HPP
#define OSTER_SPLITTING_INTERVAL_MAP_HPP

#include <unordered_set>
#include <map>
#include <iterator>
#include <limits>

namespace oster {

template<typename K, typename V>
class SplittingIntervalMap {
  using ValueContTy = std::unordered_map<V* const, std::size_t>;
  using ValueRefTy = V*;
  using InterContTy = std::map<K, ValueRefTy>;
  using iterator = InterContTy::iterator;
  using const_iterator = InterContTy::const_iterator;
  using reverse_iterator = InterContTy::reverse_iterator;
  using const_reverse_iterator = InterContTy::const_reverse_iterator;
  using key_type = InterContTy::key_type;
  using mapped_type = InterContTy::mapped_type;
  
  /// @brief Implemented using the approach that the key is the lower bound (inclusive), 
  ///        and that the intervals upper bound be the next key in the ordered map.
  InterContTy Intervals{{std::numeric_limits<K>::lowest(),nullptr}};
  /// @brief Stores the values, and a reference count of how many intervals reference this value.
  ValueContTy Values;



public:

  SplittingIntervalMap() = default;
  ~SplittingIntervalMap() = default;


  inline void insert_interval(const K& keyBegin, const K& keyEnd, V& _val)
  {
    if (not (keyBegin < keyEnd)) return; // no neg or zero width intervals

    auto val = copy_and_own(_val);
    auto intervalBegin = Intervals.insert_or_assign( keyBegin, val ).first;
    auto intervalEnd = Intervals.lower_bound( keyEnd );

    if ( intervalEnd != Intervals.end() ) {
      if ( keyEnd < intervalEnd->first ) {
        --intervalEnd;
        if ( intervalEnd != Intervals.begin() && *intervalEnd->second == *val ) //TODO fix because presumes that Values contains no duplicates
            --intervalEnd;
      }
      intervalEnd = Intervals.insert( intervalEnd, make_pair( keyEnd, intervalEnd->second ) );
    } else
      intervalEnd = Intervals.insert( intervalEnd, make_pair( keyEnd, Intervals.rbegin()->second ) );

    Intervals.erase( ++intervalBegin, intervalEnd );
  }

  // inline iterator& insert(iterator& iter, V& val);
  // inline iterator& insert(std::pair<K, V&>&& pair);

  inline iterator& insert(K& key, V& _val)
  {
    auto it = Intervals.insert_or_assign(key, copy_and_own(_val)).first; //TODO decrement ref if we do assign
    auto prev = std::prev(it);
    auto next = std::next(it);
    if (next != end() && next.second != nullptr)  // if next element in intervals is not the sequential neighbor of key
      Intervals[++key] = prev.second; // asign whatever value the interval had before
  }

  inline void erase_interval(const K& keyBegin, const K& keyEnd) 
  {
    if (keyBegin <= keyEnd) return; // no negative or zero width erases with interval erase
    iterator last = Intervals.upper_bound(keyEnd);
    if (last == end()) return; // means that Intervals is empty up to the keyEnd; so just leave
    iterator prev = Intervals.upper_bound(keyBegin);
    if (last == prev) { // case: no boundaries exists between [keyBegin,keyEnd) (no erase needed just insertions)
      Intervals.insert_or_assign(keyBegin, nullptr);
      iterator endIt = Intervals.find(keyEnd);
      if (endIt != end() && endIt.second != nullptr)
        Intervals.insert_or_assign(keyEnd, last.second);
      return;
    } // case: there are boundaries in between [keyBegin,keyEnd) (they must be erased)

    iterator beginIt = Intervals.lower_bound(keyBegin);
    iterator endIt = Intervals.lower_bound(keyEnd);
    const ValueRefTy endVal = ((endIt != end() && endIt.first == keyEnd) 
                                ? endIt.second 
                                : last.second);

    for (auto it = beginIt; it != endIt && it != end(); ++it)
      decrement_ref(it.second);
    if (endVal == nullptr && endIt.first == keyEnd && last.first < keyEnd) // if end would be nullptr just remove it
      ++endIt;
    if (beginIt.first == keyBegin) // if we will be removing the begin node, don't just overwrite it later
      ++beginIt;
    Intervals.erase(beginIt, endIt); // `last` and `prev` are now `invalid`
    Intervals.insert_or_assign(keyBegin, nullptr);
    if (endVal != nullptr)
      Intervals.insert_or_assign(keyEnd, lastVal);

    return;
  }

  inline iterator& erase(iterator& iter)
  {
    //TODO
  }

  inline iterator begin() { return Intervals.begin(); }
  inline iterator end() { return Intervals.end(); }
  inline const_iterator begin() const { return Intervals.begin(); }
  inline const_iterator end() const { return Intervals.end(); }
  inline const_iterator cbegin() const { return Intervals.cbegin(); }
  inline const_iterator cend() const { return Intervals.cend(); }
  inline reverse_iterator rbegin() { return Intervals.rbegin(); }
  inline reverse_iterator rend() { return Intervals.rend(); }
  inline const_reverse_iterator rbegin() const { return Intervals.rbegin(); }
  inline const_reverse_iterator rend() const { return Intervals.rend(); }
  inline const_reverse_iterator crbegin() const { return Intervals.crbegin(); }
  inline const_reverse_iterator crend() const { return Intervals.crend(); }

  inline iterator find(const k& key) const
  {
    auto it = Intervals.upper_bound(key);
    if (it == end()) return it;
    --it;
    if (it.second == nullptr) return end();
    return it;
  }

  inline V* operator [] (const K& key) const
  {
    auto it = find(key);
    if (it == end())
      return nullptr;
    return it->second;
  }

  inline void erase_interval(const iterator& iterBegin, const K& iterEnd) 
  { 
    erase_interval(iterBegin, Intervals.lower_bound(iterEnd));
    //TODO fix the ranges
  }

  inline void erase(const K& key)
  {
    const auto& it = find(key);
    if (it != end() && it->first == key)
      erase(it);
  }

  inline void clear()
  {
    Intervals.clear();
    Values.clear();
  }

protected:

  inline V* copy_and_own(V& val)
  {
    auto it = Values.find(val);
    if (it != Values.end()) {
      it->second++;
      return it->first;
    }
    it = Values.insert(new V, 1ull);
    *(it->first) = val; // this should copy the value
    return it->first;
  }

  inline void decrement_ref(const ValueRefTy& vRef)
  {
    if (vRef == nullptr) return;
    auto it = Values.find(vRef);
    if (it == Values.end()) return;
    if (--(it->second) != 0ull) return;
    delete vRef;
  }

};

} //?namespace oster

#endif //OSTER_SPLITTING_INTERVAL_MAP_HPP
