/**
 * @file Enums.hpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief Convenient place to put shared enums
 * @version alpha 0.0.1
 * @date 2023-05-16
 * 
 * @copyright Copyright (c) 2023
 * 
 */


#include <scabbard/Enums.hpp>

namespace scabbard {


  inline std::ostream& operator << (std::ostream& out, const InstrData& data) noexcept
  {
    std::bitset<16> bs(data);
    return (out << std::string((data & InstrData::_RUNTIME_CONDITIONAL) ? "RT_COND, " : "")
         << std::string((data & InstrData::ON_DEVICE) ? "INSTR_ON_DEVICE, " : "")
         << std::string((data & InstrData::ON_HOST) ? "INSTR_ON_HOST, " : "")
         << std::string((data & InstrData::UNKNOWN_HEAP) ? "UNKNOWN_HEAP, " : "")
         << std::string((data & InstrData::DEVICE_HEAP) ? "DEVICE_HEAP, " : "")
         << std::string((data & InstrData::HOST_HEAP) ? "HOST_HEAP, " : "")
         << std::string((data & InstrData::ATOMIC_MEM) ? "ATOMIC_MEM, " : "")
         << std::string((data & InstrData::MANAGED_MEM) ? "MANAGED_MEM, " : "")
         << std::string((data & InstrData::READ) ? "READ, " : "")
         << std::string((data & InstrData::WRITE) ? "WRITE, " : "")
         << std::string((data & InstrData::ALLOCATE) ? "ALLOCATE, " : "")
         << std::string((data & InstrData::FREE) ? "FREE, " : "")
         << "(0b" << bs << ")");
  }


namespace instr {

  inline std::string to_string(const ModuleType& modTy)
  {
    switch (modTy) {
      case ModuleType::HOST:
        return "HOST";
      case ModuleType::DEVICE:
        return "DEVICE";
      case ModuleType::UNKNOWN_MODULE:
      default:
        return "<UNKNOWN_MODULE_TYPE>";
    }
  }

  inline std::ostream& operator << (std::ostream& out, const ModuleType& modTy) noexcept
  {
    return (out << ::scabbard::instr::to_string(modTy));
  }


} //?namespace instr


} //?namespace scabbard
