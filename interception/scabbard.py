#!@Python_EXECUTABLE@

"""*
 * @file scabbard.py
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief Command line interface for scabbard util 
 *        derived from https://github.com/LLNL/SCABBARD/blob/e6c9ece1356c93418a04452f98f0f55497f4bf4d/interception/scabbard.py
 *        used to implement the LD_PRELOAD trick for getting the scabbard instrumenter working.
 * @date 2024-05-23
 * 
 *"""

import subprocess
import sys
import os
from colors import *
from argconfig import parseScabbardArgs, printScabbardHelp

SCABBARD_PATH:str = os.environ['SCABBARD_PATH'] if 'SCABBARD_PATH' in os.environ else os.path.dirname(os.path.abspath(__file__))
# sys.path.append(SCABBARD_PATH)
# from libs.scabbard import scabbardlib as scabbard

INTERCEPT_LIB:str = SCABBARD_PATH+"/intercept.so"

def runBuildCommand(params: list) -> None:
    prGreen('*** SCABBARD ***')
    prGreen('Intercepting commands in: ' + ' '.join(params))
    params.insert(0, 'LD_PRELOAD='+INTERCEPT_LIB)
    
    env: dict = dict(os.environ)
    
    if 'SCABBARD_PATH' not in env:
        env.update({'SCABBARD_PATH':os.path.dirname(os.path.abspath(__file__))})
    if 'SCABBARD_METADATA_FILE' not in env:
        env.update({'SCABBARD_METADATA_FILE':f"{os.path.abspath(os.getcwd())}/scabbard.metadata"})

    try:
        cmdOutput = subprocess.run(' '.join(params), shell=True, check=True, env=env)
    except Exception as e:
        prRed(e)
        raise RuntimeError('Error when running scabbard.intercept on a build command') from e

#     scabbard.merge_stats_reports('./report/', './', 'output')
#     scabbard.generate_remark_reports('./report/', './', ['output'])


def instr(scabbard_args, args) -> None:
    if 'meta-file' not in scabbard_args or scabbard_args.meta_file is not None and len(scabbard_args.meta_file) > 0:
        os.environ.update({'SCABBARD_METADATA_FILE':scabbard_args.meta_file[0]})
    else:
        os.environ.update({'SCABBARD_METADATA_FILE':f"{os.path.abspath(os.getcwd())}/anon.scabbard.meta"})
    runBuildCommand(args)
    prGreen(f"\n[scabbard.instr:INFO] Build Finished!\n[scabbard.instr:INFO] Meta-file generated: {os.environ['SCABBARD_METADATA_FILE']}\n")
    

def trace(scabbard_args, args) -> None:
    env = dict(os.environ)
    if 'trace-file' not in scabbard_args or scabbard_args.trace_file is not None and len(scabbard_args.trace_file) > 0:
        env.update({'SCABBARD_TRACE_FILE':scabbard_args.meta_file[0]})
    else:
        env.update({'SCABBARD_TRACE_FILE':f"{os.path.abspath(args[0])}.scabbard.trace"})
    if 'SCABBARD_INSTRUMENTED_EXE_NAME' not in env:
        env.update({'SCABBARD_INSTRUMENTED_EXE_NAME':os.path.abspath(args[0])})
    try:
        cmdOutput = subprocess.run(' '.join(args), shell=True, check=True, env=env)
    except Exception as e:
        prRed(e)
        raise RuntimeError('Error when running scabbard on a trace command') from e
    prGreen(f"[scabbard.trace:INFO] Trace Finished!\n[scabbard.trace:INFO] Trace-file generated: `{os.environ['SCABBARD_TRACE_FILE']}\n")


def verif(scabbard_args, args) -> None:
    if 'trace-file' not in scabbard_args or scabbard_args.trace_file is None or not len(scabbard_args.trace_file) > 0:
        raise RuntimeError("scabbard trace expected a trace file as an argument but found none!")
    if 'meta-file' not in scabbard_args or scabbard_args.meta_file is None or not len(scabbard_args.meta_file) > 0:
        raise RuntimeError("scabbard trace expected a trace file as an argument but found none!")
    try:
        cmdOutput = subprocess.run(f"{SCABBARD_PATH}/verif {scabbard_args.meta_file[0]} {scabbard_args.trace_file[0]}", shell=True, check=True)
    except Exception as e:
        prRed(e)
        raise RuntimeError('Error when running scabbard.verif') from e



def main(argv:list) -> None:
    try:
        scabbard_args, args = parseScabbardArgs(argv[1:])
        if 'mode' not in scabbard_args or scabbard_args.mode is None or not len(scabbard_args.mode)>0:
            prRed("please select a mode (instr|trace|verif) when using the scabbard interface!")
            print(argv) #DEBUG
            printScabbardHelp()
            exit(1)
        match scabbard_args.mode:
            case 'instr':
                instr(scabbard_args, args)
            case 'trace':
                trace(scabbard_args, args)
            case 'verif':
                verif(scabbard_args, args)
            case other:
                prRed(f"`{other!s}` is not a recognized mode for scabbard")
                printScabbardHelp()
    except Exception as e:
        prRed(e)



if __name__ == '__main__':
    main(sys.argv)