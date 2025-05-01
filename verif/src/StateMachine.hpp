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

#include "TraceReader.hpp"

#include <scabbard/TraceData.hpp>
#include <scabbard/less.hpp>

#include <unordered_set>
#include <set>
#include <map>
#include <tuple>
#include <memory>

namespace scabbard {
namespace verif {

  class StateMachine {

    using Addr_t = uint64_t;
    using LTime_t = uint64_t;
    using StreamId_t = uint64_t;
    using MemSpaceTy = std::map<Addr_t,std::shared_ptr<const TraceData>>;

    TraceFile& trace;
    MemSpaceTy mem;
    std::map<Addr_t,size_t> allocs;
    LTime_t last_global_sync = __UINT64_MAX__;
    std::map<StreamId_t,LTime_t> last_stream_sync;

  public:
    StateMachine(TraceFile& trace_);
    
    enum ResultStatus { GOOD=0, ERROR=2, WARNING=1, INTERNAL_ERROR=-1 };
    struct Result {
      ResultStatus status;
      const std::shared_ptr<const TraceData> read = {}; 
      const std::shared_ptr<const TraceData> write = {};
      std::string err_msg = "";
      friend inline bool operator == (const Result& L, const Result& R);

      inline bool operator < (const Result& other) const
      {
        if (status > other.status)
          return false;
        return ( (status < other.status)
            || ((read && other.read) && read->metadata < other.read->metadata)
            || ((write && other.write) && write->metadata < other.write->metadata)
          );
      }
      
    };

    using Results = std::map<StateMachine::Result, std::size_t>;

    /**
     * @brief run the state machine and provide the results in the provided \param results
     * @param results where the results of the state machine are stored.
     */
    void run(Results& results);

    void reset();

  private:

    /**
     * @brief check if a race has occurred if the current trace is a read event
     * @param r - the current trace data being processed that is known to be a read event
     * @param o  - the other trace data from the mem object (known to exist)
     * @return \c const ResultStatus - the resulting condition
     */
    const ResultStatus check_race_read(const TraceData& r, const TraceData& o);

    // /**
    //  * @brief check if a race has occurred if the current trace is a write event
    //  * @param w - the current trace data being processed that is known to be a write event
    //  * @param o - the other trace data from the mem object (known to exist)
    //  * @return \c const ResultStatus - the resulting condition
    //  */
    // const ResultStatus check_race_write(const TraceData& w, const TraceData& o);

  };

  std::ostream& operator << (std::ostream& out, const StateMachine::ResultStatus& status);

} //?namespace verif
} //?namespace scabbard


// namespace std {

// template<>
// struct hash<scabbard::verif::StateMachine::Result> {
//   uint64_t operator () (const scabbard::verif::StateMachine::Result& res) const
//   {
//     return ((
//             std::hash<int>()(res.status)
//             ^ (((res.read) ? std::hash<scabbard::LocationMetadata>()(res.read->metadata) : 0ul) << 1u) >> 1u)
//           ^ (((res.write) ? std::hash<scabbard::LocationMetadata>()(res.write->metadata) : 0ul) << 1u
//         )
//       );
//   }
// };

// } //?namespace std
