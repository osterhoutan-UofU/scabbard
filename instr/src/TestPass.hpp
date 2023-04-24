/**
 * @file TestPass.hpp
 * @author osterhoutan (osterhoutan@gmail.com)
 * @brief Header file for the test pass
 * 
 * @version alpha 0.0.1
 * @date 2023-04-20
 * 
 * @copyright Copyright (c) 2023
 * 
 */

#include <optional>
#include <chrono>
#include <sstream>
#include <llvm/Pass.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Function.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/IR/PassManager.h>
#include <llvm/Transforms/IPO/PassManagerBuilder.h>

namespace scabbard {
namespace instr {
namespace test { 
  
  static const auto _START = std::chrono::high_resolution_clock::now();
  template<typename T, class R>
  std::ostream& operator << (std::ostream& out, const std::chrono::duration<T,R> _dur) noexcept;
  template<typename T, class R>
  llvm::raw_ostream& operator << (llvm::raw_ostream& out, const std::chrono::duration<T,R> _dur) noexcept;

  bool runTestPass(llvm::Function& F, const std::string& origin);

  /**
   * @brief \em fn \c doInitialization : (llvm::Module& -> bool) \n
   *        The \c doInitialization method is allowed to do most of the things that \c FunctionPasses
   *         are not allowed to do. 
   *        They can add and remove functions, 
   *         get pointers to functions, \em etc. 
   *        The \c doInitialization method is designed to do simple initialization type of stuff that
   *         does not depend on the functions being processed. 
   *        The \c doInitialization method call is not scheduled to overlap with any other pass executions 
   *         (thus it should be very fast).
   * @param M \c llvm::Module& - The module being processed
   * @return \c bool - \c true if the module was modified \c false otherwise
   */
  bool runTestPass(llvm::Module& M, const std::string& origin) {
    //TODO figure out how to add code for standard instrumenting modules (probs located in libscabbard)
    // this will probably need to be done in the Umbrella or Top level header IDK if I have to do more than point to og files
    //    will probably also have to modify the LinkLibraries
    const auto delta = std::chrono::high_resolution_clock::now() - _START;
    llvm::errs() << "[scabbard::test] Module Pass was run from: `"<< origin <<"` @ " << delta << "\n"
                    "[scabbard::test]   a MODULE with the name `" << M.getModuleIdentifier() << "` was found!\n"
                    "[scabbard::test]\n";
    bool touched = false;
    for (auto& f : M.getFunctionList())
      touched |= runTestPass(f,origin + " (M->F)");
    return touched;
  }//?END fn run : (llvm::Module& -> bool)

  std::string getOperands(const llvm::User& usr) {
    std::stringstream out;
    std::string sep;
    for (const auto& op : usr.operand_values()) {
      out << sep << std::string(op->getValueName()->getKey());
      sep = ", ";
    }
    return out.str();
  }


  /**
   * @brief \em fn \c runOnFunction : (llvm::Function& -> bool) \n
   *        The \c runOnFunction method must be implemented by your subclass to do the transformation 
   *         or analysis work of your pass. 
   *        As usual, a \c true value should be returned if the function is modified.
   * @param F \c llvm::Function& - The module being processed
   * @return \c bool - \c true if the module was modified \c false otherwise
   */
  bool runTestPass(llvm::Function& F, const std::string& origin) {
    //TODO figure out how to identify if this is a __device__ or __global__ function or not
    //TODO instrument it appropriately
    //note: I will have to use different instrumentation for when called for host vs device (can we separate the two?)
    if (F.getCallingConv() != llvm::CallingConv::AMDGPU_KERNEL) 
      return false;
    const auto delta = std::chrono::high_resolution_clock::now() - _START;
    llvm::errs() << "[scabbard::test] Function Pass was run from: "<< origin <<" @ "<< delta << "\n"
                    "[scabbard::test]   a FUNCTION with the name `" << std::string(F.getName()) 
                      << "` and " << F.getInstructionCount() << " instructions was found!\n"
                    "[scabbard::test]     it has a CallingConvID of: `" << F.getCallingConv() << "`\n";
    for (const auto& bb : F.getBasicBlockList())
      for (const auto& i : bb.getInstList()) 
        if ("call" == std::string(i.getOpcodeName())) {
          llvm::errs() << "[scabbard::test]  `call` instruction found!\n"
                          "[scabbard::test]    repr: `";
          i.print(llvm::errs());
          llvm::errs() << "`\n";
        } else if ("fence" == std::string(i.getOpcodeName())) {
          llvm::errs() << "[scabbard::test]  `fence` instruction found!\n"
                          "[scabbard::test]    repr: `";
          i.print(llvm::errs());
          llvm::errs() << "`\n";
        }
    llvm::errs() << "[scabbard::test]\n";
    //note: I will need to use Function::getBasicBlockList() to get the contents of the function (mostly just regions of instruction with conditionals and loops but maybe some symbol table stuff too)
    return false;
  }//?END fn run : (llvm::Function& -> bool)



  struct LegacyTestPass : public llvm::FunctionPass {
    static char ID;
    llvm::FunctionAnalysisManager FAM;
    llvm::ModuleAnalysisManager MAM;
  public:
    LegacyTestPass() : FunctionPass(ID) {}
    bool doInitialization(llvm::Module& M) override { return runTestPass(M, "legacy"); }
    bool runOnFunction(llvm::Function& F) override { return runTestPass(F,"legacy"); }
  };//?END class LegacyTestPass

  char LegacyTestPass::ID = 0;

  struct TestPassPlugin : llvm::PassInfoMixin<TestPassPlugin> {
    const std::string origin;
    TestPassPlugin(const std::string& origin_) : origin(origin_) {}
    llvm::PreservedAnalyses run(llvm::Function &F, llvm::FunctionAnalysisManager &FAM) {
      if (!runTestPass(F,origin))
        return llvm::PreservedAnalyses::all();
      return llvm::PreservedAnalyses::none();
    }
    llvm::PreservedAnalyses run(llvm::Module &M, llvm::ModuleAnalysisManager &MAM) {
      if (!runTestPass(M, origin)) {
        return llvm::PreservedAnalyses::all();
      }
      return llvm::PreservedAnalyses::none();
    }
  };//?END class TestPassPlugin



  // << =============================== Duration Printing Utility ================================ >> 
  template<typename ratio1, typename ratio2>
  struct CompareStdRatios {
    // std::static_assert(std::is_base_of<std::ratio,ratio1>::value, "ratio1, must be a ratio");
    // std::static_assert(std::is_base_of<std::ratio,ratio1>::value, "ratio2, must be a ratio");
    static constexpr long double dif() { return (ratio1::num/ratio1::den) - (ratio2::num/ratio2::den); };
  };
  template<typename T, class R> 
  const std::string _pre0(const std::chrono::duration<T,R> dur) { return ((dur.count()<10) ? "0" : ""); }
  template<typename T, class R>
  llvm::raw_ostream& operator << (llvm::raw_ostream& out, const std::chrono::duration<T,R> _dur) noexcept {
    std::stringstream _out;
    _out << _dur;
    return out << _out.str();
  }
  template<typename T, class R>
  std::ostream& operator << (std::ostream& out, const std::chrono::duration<T,R> _dur) noexcept {
    using namespace std::chrono;
    using day_t = duration<T, std::ratio<3600 * 24>>;
    using femtosecond_t = duration<T, std::femto>;
    using picosecond_t = duration<T, std::pico>;
    enum TimeUnit {__U,__ms,_fs,_ps,_ns,_us,_ms,_s,_min,_hr,_d};
    const TimeUnit _SU = __U;
    std::chrono::duration<long double,R> dur(_dur);
    day_t d(0);
    hours h(0);
    minutes m(0);
    seconds s(0);
    milliseconds ms(0);
    microseconds us(0);
    nanoseconds ns(0);
    picosecond_t ps(0);
    // femtosecond_t fs(0);
    TimeUnit msu = _fs;
    if (CompareStdRatios<R,std::milli>::dif() > 0.0l // case: lower precision clock
        || dur > seconds(10)) { // case: "large"/"macro" time format(s)
      if (dur > day_t(3)) {
        d = duration_cast<day_t>(dur);
        dur -= d; msu = _d;
      }
      if (msu > _hr || dur > hours(3)) {
        h = duration_cast<hours>(dur);
        dur -= h; msu = ((msu > _hr) ? msu : _hr);
      }
      if (msu > _min || dur > minutes(3)) {
        m = duration_cast<minutes>(dur);
        dur -= m; msu = ((msu > _min) ? msu : _min);
      }
      if (msu > _s || dur >= seconds(10)) {
        s = duration_cast<seconds>(dur);
        dur -= s; msu = ((msu > _s) ? msu : _s);
      } 
      if (msu > _ms || dur >= microseconds(1)) {
        ms = duration_cast<milliseconds>(dur);
      } else msu = __ms;  // case: measured essentially 0 time ms
    } else /* if (CompareStdRatios<R,std::milli>::dif() < 0.0l) */ { // case: higher precision clock
      if (dur >= microseconds(10)) { // case: "small"/milli+micro time format
        ms = duration_cast<milliseconds>(dur);
        us = duration_cast<microseconds>(dur -= ms);
        msu = _ms;
      } else {
        if (dur >= picosecond_t(1)) { // case: "smaller"/nano+pico time format
          ns = duration_cast<nanoseconds>(dur);
          ps = duration_cast<picosecond_t>(dur -= ns);
          msu = _ns;
        } else                            // case: "smallest"/"too small to care about"/femto time "format"
          msu = _fs;
      // } else                              // case: "not needed "   
      //   msu = __ms;
      }
    }
    
    switch (msu) {
      case _d:
        return (out << d.count() << "d " 
                    << _pre0(h) << h.count() << ':'
                    << _pre0(m) << m.count() << ':'
                    << _pre0(s) << s.count() << '.'
                    << ms.count());
      case _hr:
        return (out << _pre0(h) << h.count() << ':'
                    << _pre0(m) << m.count() << ':'
                    << _pre0(s) << s.count() << '.'
                    << ms.count());
      case _min:
        return (out << _pre0(m) << m.count() << ':'
                    << _pre0(s) << s.count() << '.'
                    << ms.count());
      case _s:
        out << s.count();
        if (ms > milliseconds(0))
          out << '.' << ms.count();
        return (out << "s");
      case _ms:
      case _us:
        out << ms.count();
        if (us > microseconds(0))
          out << '.' << us.count();
        return (out << "ms");;
      case _ns:
      case _ps:
        out << ns.count();
        if (ps > picosecond_t(0))
          out << '.' << ps.count();
        return (out << "ns");
      case __ms:
        return (out << "<0.001ms");
      case _fs:
        return (out << "<0.001ns");
      case __U:
      default:
        return (out << "<ERROR_PARSING_DURATION>");
    }
    return out;
  }

}//?namespace test
}//?namespace instr
}//?namespace scabbard