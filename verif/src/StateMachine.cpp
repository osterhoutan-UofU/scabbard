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


  std::unordered_set<StateMachine::Result> StateMachine::run()
  {
    const InstrData FILTER = (
        InstrData::SYNC_EVENT | InstrData::DESYNC_EVENT
        | InstrData::READ | InstrData::WRITE
        | InstrData::ALLOCATE | InstrData::FREE
      );
    std::unordered_set<StateMachine::Result> results;
    size_t dbg_i = 0u; //DEBUG
    size_t dbg_j = 0u; //DEBUG
    size_t dbg_k = 0u; //DEBUG
    for (const auto& td : trace) {
      if (/* td.time_stamp == 0u || */ td.data == InstrData::NEVER) dbg_j++; //DEBUG
      if (td.data & InstrData::ON_GPU) dbg_k++; //DEBUG
      std::map<size_t, const scabbard::TraceData *>::iterator it = mem.end();
      switch (td.data & FILTER)
      {
        case InstrData::SYNC_EVENT:
          if (td.ptr == 0) {
            last_global_sync = td.time_stamp;
            last_stream_sync.clear();
          } else
            last_stream_sync[jobId_t::hash_stream_ptr(td.ptr)] = td.time_stamp;
          break;

        case InstrData::DESYNC_EVENT:
          //NOTE: currently just used to help when debugging
          //TODO handle kernel Launches
          break;

        case InstrData::WRITE:
          it = mem.find(td.ptr); //TODO: \/ logic below needs a refresh (might be flawed) \/
          if (it == mem.end()) { // first write of a pair (empty or just allocated)
            mem[td.ptr] = &td;
          } else if (not (it->second->data & InstrData::READ)) { // OR the last operation on the mem space was a read 
            mem[td.ptr] = &td;
          } else { // This is probably a race
            return {{ERROR, it->second, &td, "Data Written to after it was read from"}};
          }
          break;

        case InstrData::READ:
          it = mem.find(td.ptr);
          if (it == mem.end()) {// read with no preceding write
            results.insert({WARNING, &td, nullptr, "Read with no preceding/matching Write"}); // read with no preceding write
            break;
          } else if (td.data & InstrData::_OPT_USED) { // bulk read (memcpy device to host)
            for (; it != mem.end() && it->second->ptr < td.ptr+td._OPT_DATA; ++it) {
              auto res = check_race_read(td, *it->second);
              if (res != GOOD) {
                results.insert({res, &td, it->second, "Bulk Read/MemCpyAsync occurs before any identifiably relevant sync event"});
                break; // goto switch_exit;
              }
            }
          } else { // single read
            auto res = check_race_read(td, *it->second);
              if (res != GOOD) {
                results.insert({res, &td, it->second, "Read occurs before any identifiably relevant sync event"});
                break;
              }
          }
          break;

        case InstrData::ALLOCATE:
          allocs[td.ptr] = td._OPT_DATA;
          break;

        case InstrData::FREE: {
          auto r = allocs.find(td.ptr);
          if (r == allocs.end())
            return {{INTERNAL_ERROR, nullptr, nullptr, "\n[scabbard.verif:ERR] bad alloc data (could not find hipMalloc associated with hipFree in trace history)"}};
          for (it = mem.find(td.ptr); it != mem.end() && it->second->ptr < td.ptr+r->second; ++it)
            it = mem.erase(it);
            // mem.erase(it);
          allocs.erase(r);
          break;
        }

        default:
          break;
      }
      // switch_exit:  // quick exit for when in loops (I hate having to use GOTO)
      dbg_i++; //DEBUG
    }
    if (results.size() == 0)
      return {{GOOD, nullptr, nullptr, std::to_string(dbg_i)}};
    return results;
  }


  void StateMachine::reset()
  {
    mem.clear();
    last_global_sync = __UINT64_MAX__;
    last_stream_sync.clear();
  }




  const StateMachine::ResultStatus StateMachine::check_race_read(const TraceData& r, const TraceData& o) 
  {
    // mem[o.ptr] = &r;
    if (o.data & InstrData::WRITE) { // if mem stores a write event 
      if (last_global_sync >= o.time_stamp) // that occurred after the last global sync event
          return ResultStatus::WARNING; // return a warning
      auto res = last_stream_sync.find(o.threadId.device.job.STREAM);
      if (res != last_stream_sync.end() && res->second > o.time_stamp) // or that happened after the last stream sync event 
        return ResultStatus::WARNING; // return a warning
    } // else    // if a read event we don't care yet (could be a double read)
      mem[o.ptr] = &r;
      return ResultStatus::GOOD;
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
      case StateMachine::ResultStatus::INTERNAL_ERROR:
        return (out << "Internal ERROR occurred in scabbard verif");
      default:
        return (out << "<UNKNOWN>");
    }
  }

  inline bool operator == (const StateMachine::Result& L, const StateMachine::Result& R)
  {
    return ( (L.status == R.status)
        && ((L.read && R.read) ? L.read->metadata == R.read->metadata : L.read == R.read)
        && ((L.write && R.write) ? L.write->metadata == R.write->metadata : L.write == R.write)
      );
  }

} //?namespace verif
} //?namespace scabbard
