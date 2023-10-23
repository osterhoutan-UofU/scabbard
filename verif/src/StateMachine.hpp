/**
 * @file StateMachine.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief the state machine that process the trace data and reports on the data races 
 * @version alpha 0.0.1
 * @date 2023-10-20
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#pragma once

#include <scabbard/TraceData.hpp>
#include <less.hpp>

#include <multiset>
#include <map>
#include <tuple>

namespace scabbard {
namespace verif {

  class StateMachine {

    const std::multiset<TraceData>& trace;
    std::map<void*,const TraceData*> mem;
    std::size_t last_sync = __UINT64_MAX__;

  public:
    StateMachine(const std::multiset<TraceData>& trace_);
    
    enum ResultStatus { GOOD, ERROR, WARNING };
    struct Result {
      ResultStatus status;
      const TraceData* read = nullptr; 
      const TraceData* write = nullptr;
    };

    const Result run();

    void reset();

  private:

    /**
     * @brief check if a race has occurred if the current trace is a read event
     * @param r - the current trace data being processed that is known to be a read event
     * @param o  - the other trace data from the mem object (known to exist)
     * @return \c const Result - the resulting condition
     */
    const Result check_race_read(const TraceData& r, const TraceData& o) const;

    /**
     * @brief check if a race has occurred if the current trace is a write event
     * @param w - the current trace data being processed that is known to be a write event
     * @param o - the other trace data from the mem object (known to exist)
     * @return \c const Result - the resulting condition
     */
    const Result check_race_write(const TraceData& w, const TraceData& o) const;

  };

} //?namespace verif
} //?namespace scabbard