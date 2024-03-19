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


  const StateMachine::Result StateMachine::run()
  {
    const InstrData FILTER = (
        InstrData::SYNC_EVENT 
        | InstrData::READ | InstrData::WRITE
        | InstrData::ALLOCATE | InstrData::FREE
      );
    for (const auto& td : trace) {
      std::map<size_t, const scabbard::TraceData *>::iterator it = mem.end();
      switch (td.data & FILTER)
      {
        case InstrData::SYNC_EVENT:
          if (td.ptr == 0) {
            last_global_sync = td.time_stamp;
            last_stream_sync.clear();
          } else
            last_stream_sync[td.ptr] = td.time_stamp;
          break;

        case InstrData::WRITE:
          it = mem.find(td.ptr);
          if (it == mem.end() && not (it->second->data & InstrData::READ)) { // first write of a pair (empty or just allocated)
            mem[td.ptr] = &td;
          } else { // This is probably a race
            return {ERROR, it->second, &td};
            //NOTE: because we don't know if a kernel was running at the time this could be a false positive
          }
          break;

        case InstrData::READ:
          it = mem.find(td.ptr);
          if (td.data & InstrData::_OPT_USED) { // bulk read (memcpy device to host)
            while (it->second->ptr < td.ptr+td._OPT_DATA && it != mem.end()) {
              auto res = check_race_read(td, *it->second);
              if (res != GOOD)
                return {res, &td, it->second};
              ++it; // iterate to next mem address
            }
          } else if (it != mem.end()) { // single read
            auto res = check_race_read(td, *it->second);
              if (res != GOOD)
                return {res, &td, it->second};
          } else { // read with no preceding write
            return {WARNING, &td, nullptr}; // read with no preceding write
          }
          break;

        case InstrData::ALLOCATE:
          // it is currently unessisary to do anything for an allocation
          break;

        case InstrData::FREE:
          mem.erase(mem.find(td.ptr), mem.find(td.ptr+td._OPT_DATA));
          break;

        default:
          break;
      } 
    }
    return {GOOD, nullptr, nullptr};
  }


  void StateMachine::reset()
  {
    mem.clear();
    last_sync = __UINT64_MAX__;
  }




  const StateMachine::ResultStatus StateMachine::check_race_read(const TraceData& r, const TraceData& o) 
  {
    if (o.data & InstrData::WRITE) { // if mem stores a write event 
      if (last_global_sync > o.time_stamp) // that occurred after the last global sync event
          return ResultStatus::WARNING; // return a warning
      auto res = last_stream_sync.find(o.threadId.device.job.STREAM);
      if (res != last_stream_sync.end() && res->second > o.time_stamp) // that happened after the last stream sync event 
        return ResultStatus::WARNING; // return a warning
    } else {    // if a read event we don't care yet (could be a double read)
      mem[o.ptr] = &r;
      return ResultStatus::GOOD;
    }
  }

  // const StateMachine::ResultStatus StateMachine::check_race_write(const TraceData& w, const TraceData& o)
  // {
  //
  // }


  std::ostream& operator << (std::ostream& out, const StateMachine::ResultStatus& status)
  {
    switch (status)
    {
      case StateMachine::ResultStatus::ERROR:
        return (out << "DATA RACE FOUND");
        break;
      case StateMachine::ResultStatus::WARNING:
        return (out << "POSSIBLE Data Race FOUND");
      case StateMachine::ResultStatus::GOOD:
        return (out << "NO data races detected");
      default:
        return (out << "<UNKNOWN>");
    }
  }

} //?namespace verif
} //?namespace scabbard
