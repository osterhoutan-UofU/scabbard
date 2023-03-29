
#include "Consumer.hpp"

namespace scabbard {

  Consumer::Consumer(clang::CompilerInstance &CI, std::set<std::string> ParsedTemplates)
    : Instance(Instance), ParsedTemplates(ParsedTemplates) 
  {}



  bool Consumer::HandleTopLevelDecl(clang::DeclGroupRef DG)
  {
    //TODO
  }



  void Consumer::HandleTranslationUnit(clang::ASTContext& context)
  {
    //TODO
  }

} //namespace scabbard
