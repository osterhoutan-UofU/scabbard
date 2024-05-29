"""*
 * @file argconfig.py
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief configures the argument parser for the scabbard python script
 * @date 2024-05-23
 * 
 *"""
 
import os
from pathlib import Path
from typing import List
# from enum import Enum
from dataclasses import dataclass
from argparse import ArgumentParser, ArgumentError, ArgumentTypeError
import shutil


__all__ = ['ScabbardArgParser','parseScabbardArgs']

ScabbardArgParser: ArgumentParser = ArgumentParser(
        prog="scabbard",
        usage="""
        """,
        epilog="""
        """    
    )

_SubArgParser = ScabbardArgParser.add_subparsers(
        title='mode',
        description="""
        """,
        help="""
        """,
    )

InstrArgParser = _SubArgParser.add_parser('instr',
        aliases=['build','instrument','instr','compile','link'
                 'Build','Instrument','Instr','Compile','Link'
                 'BUILD','INSTRUMENT','INSTR','COMPILE','LINK'],
        prog='instrument/build',
        help="",
        usage="""
        """,
        epilog="""
        """    
    )
InstrArgParser.set_defaults(mode='instr')

TraceArgParser = _SubArgParser.add_parser('trace',
        aliases=['trace','run','launch','Trace','Run','Launch',"TRACE","RUN","LAUNCH"],
        prog='trace-runner',
        help="",
        usage="""
        """,
        epilog="""
        """    
    )
TraceArgParser.set_defaults(mode='trace')

VerifArgParser = _SubArgParser.add_parser('verif',
        aliases=['verify','verif','analyse','analyze',
                 'Verify','Verif','Analyze','Analyse',
                 'VERIFY','VERIF','ANALYZE','ANALYSE'],
        prog='verifier',
        help="",
        usage="""
        """,
        epilog="""
        """    
    )
VerifArgParser.set_defaults(mode='verif')

InstrArgParser.add_argument('--meta-file',
        nargs=1,
        default=None,
        metavar='<file-path>',
        required=False,
        help="filepath to where the metadata file to be generated will be written to (this is used by the verify step so remember it)"                           
    )
VerifArgParser.add_argument('meta-file',
        nargs=1,
        default=None,
        metavar='<file-path>',
        help="filepath to where the metadata file generated during the instrumentation/build step"                           
    )


TraceArgParser.add_argument('--trace-file','-t','-o',
        nargs=1,
        default=None,
        metavar='<file-path>',
        required=False,
        help="filepath to where the tracefile will be generated"                           
    )
VerifArgParser.add_argument('trace-file',
        nargs=1,
        default=None,
        metavar='<file-path>',
        help="filepath to where the trace file "                           
    )

def parseScabbardArgs(argv:List[str]):
    return ScabbardArgParser.parse_known_args(argv)


# __all__ = ['ParsedArgs','parseArgs']


# @dataclass(repr=True,eq=False,order=False,unsafe_hash=True)
# class ParsedArgs:
#     mode: str | None
#     meta_file: Path | None
#     trace_file: Path | None
#     executable: Path | None
#     args: List[str] | None


# def _parseComplexModeArg(result:ParsedArgs, arg:str, argv: List[str]) -> None:
#     path = shutil.which(arg)


# def parseArgs(argv: List[str]) -> ParsedArgs:
#     result: ParsedArgs = ParsedArgs(None,None,None,None,None)
#     match str.lower(argv[1]):
#         case 'build' | 'instrument' | 'instr' | 'compile' | 'comp' | 'i' | 'b' | 'c':
#             result.mode = 'instr'
#         case 'run' | 'launch' | 'trace' | 'r' | 'l' | 't':
#             result.mode = 'run'
#         case 'verify' | 'verif' | 'ver' | 'analyse' | 'analyze' | 'anal' | 'v' | 'a':
#             result.mode = 'verif'
#         case 'make' | 'clang' | 'clang++' | 'hipcc' | 'ninja' | 'cc' | 'cpp':
#             result.mode = 'instr'
#             tmp = shutil.which(argv[1])
#             if tmp is not None:
#                 result.executable = Path(tmp)
#                 result.args = argv[2:] if len(argv)>=3 else None
#                 return result
#             else: 
#                 raise ArgumentError('mode',f"could not identify `{argv[1]}` as a scabbard mode or valid executable!")
#         case _:
#             _parseComplexModeArg(result, argv[1], argv[2:] if len(argv)>=3 else list())
    

 
 
 