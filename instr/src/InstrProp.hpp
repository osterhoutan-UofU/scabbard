/**
 * @file InstrProp.hpp
 * @author osterhoutan (osterhoutan@gmail.com)
 * @brief Properties concerned with when/how an instruction is instrumented. 
 * @version alpha 0.0.1
 * @date 2023-05-19
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include "Enums.hpp"

#include <functional>

namespace scabbard {
namespace instr {


template <class InstTy>
struct InstrProp {

  InstrWhen instrWhen;

  std::function<void()> Instr;


};


} //?namespace instr
} //?namespace scabbard