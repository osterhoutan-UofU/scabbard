/**
 * @file Enums.hpp
 * @author osterhoutan (osterhoutan@gmail.com)
 * @brief Convenient place to put shared enums
 * @version alpha 0.0.1
 * @date 2023-05-16
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#pragma once

#include <cstdint>

namespace scabbard {
namespace instr {

   /**
    * @brief ENUM BYTE MAP\n
    *   \code{.txt}
    *     0b_0000_0000_0000_0000
    *         ^ ^  ^ ^  ^ ^  ^ ^
    *         | |  | |  | |  | L Runtime Conditional
    *         | |  | |  | |  L Instr On Host (CPU)
    *         | |  | |  | L Instr on Device (GPU)
    *         | |  | |  L Instr as READ
    *         | |  | L Instr as WRITE
    *         | |  L Instr as ATOMIC
    *         | L Instr as global DEVICE memory
    *         L Instr as global MANAGED memory
    *   \endcode
    */
  enum InstrWhen : std::int16_t {
    // This inst should never be instrumented (no chance of being of interest in traces)
    NEVER                 = 0b00000000,
    NO                    = 0b00000000, // just a useful duplicate of NEVER
    // This might be of interest, but we can only know after a runtime conditional is run.
    _RUNTIME_CONDITIONAL  = 0b00000100,  // Note: conditional is only valid for HOST/CPU
    // This inst should always be instrumented (no chance of not being of interest in traces) 
    ALWAYS                = 0b01001010,
    // If this is on the GPU/Device it should be instrumented
    ON_DEVICE             = 0b00100000,
    ON_GPU                = 0b00100000,
    // If this is on the CPU/Host it shoule be instrumented
    ON_HOST               = 0b00000010,
    ON_CPU                = 0b00000010,
    //
    READ                  = 0b000001000000,
    //
    WRITE                 = 0b000100000000,
    //
    ATOMIC                = 0b010000000000,
    //
    DEVICE_GLOBAL         = 0b0001000000000000,
    //
    MANAGED_MEM           = 0b0100000000000000,
  };

  enum ModuleType { HOST=0, DEVICE=1, UNKNOWN_MODULE=-1 };

} //?namespace instr
} //?namespace scabbard