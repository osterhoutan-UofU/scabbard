/**
 * @file StateMachine.cpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief the state machine that process the trace data and reports on the data races 
 * @version alpha 0.0.1
 * @date 2023-10-20
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include "StateMachine.hpp"

namespace scabbard {
namespace verif {

  StateMachine::StateMachine(const std::multiset<TraceData>& trace_)
    : trace(trace_)
  {}


  StateMachine::Result StateMachine::run()
  {
    const InstrData FILTER = (
        InstrData::SYNC_EVENT 
        | InstrData::READ | InstrData::WRITE
        | InstrData::ALLOCATE | InstrData::FREE
      );
    for (const auto& td : trace) {
      switch (td.data & FILTER)
      {
        case InstrData::SYNC_EVENT:
          last_sync = td.time_stamp;
          break;

        case InstrData::WRITE:
          auto& it = mem.find(td.ptr);
          if (it == mem.end() && not (it->second->data & InstrData::READ)) { // first write of a pair (empty or just allocated)
            mem[td.ptr] = &td;
          } else { // This is probably a race
            return {ERROR, it->second, &td};
            //NOTE: because we don't know if a kernel was running at the time this could be a false positive
          }
          break;

        case InstrData::READ:
          auto& it = mem.find(td.ptr);
          if (td.data & InstrData::_OPT_USED) { // bulk read (memcpy device to host)
            while (it->second->ptr < td.ptr+td._OPT_DATA && it != mem.end()) {
              auto res = check_race_read(td, *it->second);
              if (res.status != GOOD)
                return res;
              ++it; // iterate to next mem address
            }
          } else if (it != mem.end()) { // single read
            auto res = check_race_read(td, *it->second);
              if (res.status != GOOD)
                return res;
          } else { // read with no preceding write
            return {WARNING, &td, nullptr}; // read with no preceding write
          }
          break;

        case InstrData::ALLOCATE:
          // it is currently unessisary to do anything for an allocation
          break;

        case InstrData::FREE:
          mem.erase(td.ptr, td.ptr+td._OPT_DATA);
          break;

        default:
          
      } 
    }
  }


  void StateMachine::reset()
  {
    mem.clear();
    last_sync = __UINT64_MAX__;
  }




  const Result StateMachine::check_race_read(const TraceData& r, const TraceData& o) const 
  {
    if (o.data & InstrData::WRITE) { // if mem stores a write event 
      if (last_sync > o.time_stamp) // that occurred after the last sync event
        return {ResultStatus::WARNING, &r, &o}; // return a warning
    } else {    // if a read event we don't care yet (could be a double read)
      mem[o.ptr] = &r;
      return {ResultStatus::GOOD, nullptr, nullptr};
    }
  }

  const Result StateMachine::check_race_write(const TraceData& w, const TraceData& o) const 
  {

  }

} //?namespace verif
} //?namespace scabbard
