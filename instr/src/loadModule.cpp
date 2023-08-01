/**
 * @file loadModule.cpp
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief a copy of the load module code from llvm-project/clang/lib/CodeGen/CodeGenAction.cpp
 *        used to safely load in a complex module
 * @version alpha 0.0.1
 * @date 2023-07-31
 * 
 */

#include "loadModule.hpp"

#include <clang/CodeGen/CodeGenAction.h>
// #include <CodeGenModule.h>
// #include <CoverageMappingGen.h>
// #include <MacroPPCallbacks.h>
#include <clang/AST/ASTConsumer.h>
#include <clang/AST/ASTContext.h>
#include <clang/AST/DeclCXX.h>
#include <clang/AST/DeclGroup.h>
#include <clang/Basic/DiagnosticFrontend.h>
#include <clang/Basic/FileManager.h>
#include <clang/Basic/LangStandard.h>
#include <clang/Basic/SourceManager.h>
#include <clang/Basic/TargetInfo.h>
#include <clang/CodeGen/BackendUtil.h>
#include <clang/CodeGen/ModuleBuilder.h>
#include <clang/Driver/DriverDiagnostic.h>
#include <clang/Frontend/CompilerInstance.h>
#include <clang/Frontend/FrontendDiagnostic.h>
#include <clang/Lex/Preprocessor.h>
#include <llvm/ADT/Hashing.h>
#include <llvm/Bitcode/BitcodeReader.h>
#include <llvm/CodeGen/MachineOptimizationRemarkEmitter.h>
#include <llvm/Demangle/Demangle.h>
#include <llvm/IR/DebugInfo.h>
#include <llvm/IR/DiagnosticInfo.h>
#include <llvm/IR/DiagnosticPrinter.h>
#include <llvm/IR/GlobalValue.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/LLVMRemarkStreamer.h>
#include <llvm/IR/Module.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/LTO/LTOBackend.h>
#include <llvm/Linker/Linker.h>
#include <llvm/Object/Archive.h>
#include <llvm/Pass.h>
#include <llvm/Support/MemoryBuffer.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/TimeProfiler.h>
#include <llvm/Support/Timer.h>
#include <llvm/Support/ToolOutputFile.h>
#include <llvm/Support/YAMLTraits.h>
#include <llvm/Transforms/IPO/Internalize.h>


namespace scabbard {
namespace instr {

std::unique_ptr<llvm::Module> loadModule(llvm::MemoryBufferRef MBRef) 
{
  using namespace llvm;
  using namespace clang;
  // CompilerInstance &CI = getCompilerInstance();
  // SourceManager &SM = CI.getSourceManager();

  // For ThinLTO backend invocations, ensure that the context
  // merges types based on ODR identifiers. We also need to read
  // the correct module out of a multi-module bitcode file.
  if (!CI.getCodeGenOpts().ThinLTOIndexFile.empty()) {
    VMContext->enableDebugTypeODRUniquing();

    auto DiagErrors = [&](Error E) -> std::unique_ptr<llvm::Module> {
      // unsigned DiagID =
      //     CI.getDiagnostics().getCustomDiagID(DiagnosticsEngine::Error, "%0");
      // handleAllErrors(std::move(E), [&](ErrorInfoBase &EIB) {
      //   CI.getDiagnostics().Report(DiagID) << EIB.message();
      // });
      return {};
    };

    Expected<std::vector<BitcodeModule>> BMsOrErr = getBitcodeModuleList(MBRef);
    if (!BMsOrErr)
      return DiagErrors(BMsOrErr.takeError());
    BitcodeModule *Bm = llvm::lto::findThinLTOModule(*BMsOrErr);
    // We have nothing to do if the file contains no ThinLTO module. This is
    // possible if ThinLTO compilation was not able to split module. Content of
    // the file was already processed by indexing and will be passed to the
    // linker using merged object file.
    if (!Bm) {
      auto M = std::make_unique<llvm::Module>("empty", *VMContext);
      // M->setTargetTriple(CI.getTargetOpts().Triple); // might cause issues
      return M;
    }
    Expected<std::unique_ptr<llvm::Module>> MOrErr =
        Bm->parseModule(*VMContext);
    if (!MOrErr)
      return DiagErrors(MOrErr.takeError());
    return std::move(*MOrErr);
  }

  llvm::SMDiagnostic Err;
  // if (std::unique_ptr<llvm::Module> M = parseIR(MBRef, Err, *VMContext))
  //   return M;

  // Translate from the diagnostic info to the SourceManager location if
  // available.
  // TODO: Unify this with ConvertBackendLocation()
  SourceLocation Loc;
  if (Err.getLineNo() > 0) {
    assert(Err.getColumnNo() >= 0);
    Loc = SM.translateFileLineCol(SM.getFileEntryForID(SM.getMainFileID()),
                                  Err.getLineNo(), Err.getColumnNo() + 1);
  }

  // Strip off a leading diagnostic code if there is one.
  StringRef Msg = Err.getMessage();
  if (Msg.startswith("error: "))
    Msg = Msg.substr(7);

  // unsigned DiagID =
  //     CI.getDiagnostics().getCustomDiagID(DiagnosticsEngine::Error, "%0");

  // CI.getDiagnostics().Report(Loc, DiagID) << Msg;
  return {};
}


} //?namespace instr
} //?namespace scabbard
