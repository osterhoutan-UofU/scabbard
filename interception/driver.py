#!@Python_EXECUTABLE@

"""*
 * @file driver.py
 * @author osterhoutan (osterhoutan+scabbard@gmail.com)
 * @brief derived from https://github.com/LLNL/FAROS/blob/e6c9ece1356c93418a04452f98f0f55497f4bf4d/interception/clang_driver.py
 *        used to implement the LD_PRELOAD trick for getting the scabbard instrumenter working.
 * @date 2024-05-23
 * 
 *"""

import os
import pathlib
import subprocess
import platform
import sys
from colors import prGreen, prCyan, prRed
# from exceptions import CompileException
from builtins import Exception
from scabbard import runBuildCommand, SCABBARD_PATH

# --------------------------------------------------------------------------- #
# --- Installation Paths ---------------------------------------------------- #
# --------------------------------------------------------------------------- #

ADDED_FLAGS: list = [
        f'-fpass-plugin={SCABBARD_PATH}/libinstr.so', 
        f'-L{SCABBARD_PATH}',
        '-ltrace',
        '-lpthread',
        '-g'
    ]

# --------------------------------------------------------------------------- #
# --- Classes --------------------------------------------------------------- #
# --------------------------------------------------------------------------- #

# class Command:
#   def __init__(self, cmd):
#     self.name = cmd[0]
#     self.parameters = cmd[1:]

#   def executeOriginalCommand(self):
#     try:
#       cmd = [self.name] + self.parameters
#       subprocess.run(' '.join(cmd), shell=True, check=True)
#     except subprocess.CalledProcessError as e:
#       prRed(e)

#   def getOriginalCommand(self):
#     return ' '.join([self.name] + self.parameters[1:])

#   def runCommandWithFlags(self):
#     new_cmd = [self.name] + ADDED_FLAGS.split() + self.parameters
#     new_cmd.insert(0, 'PATH='+os.getenv('FAROS_SAVEDPATH'))
#     try:
#       cmdOutput = subprocess.run(' '.join(new_cmd), shell=True, check=True)
#     except Exception as e:
#       prRed(e)
#       raise CompileException(new_cmd) from e

def runCommandWithFlags(argv: list) -> None:
    """
    _summary_

    Args:
        argv (_type_): _description_

    Raises:
        CompileException: _description_
    """
    env: dict = dict(os.environ)
    if "SCABBARD_PATH" not in env:
        env.update({"SCABBARD_PATH": SCABBARD_PATH})
    
    new_cmd: str
    if any({"clang","hipcc"}, lambda x: x in os.path.basename(argv[0])):
        new_argv = list(argv)
        new_argv[1:1] = ADDED_FLAGS
        new_cmd = ' '.join(new_argv)
    elif "cmake" in os.path.basename(argv[0]):
        prRed("\n[scabbard.intercept:WARN] Intercepted a CMake command!"+
              "\n                           -> CMake is not supported by the scabbard intercepter!"+
              "\n                              Try directly calling the configured build tool (i.e. `make`, `ninja`, etc.)\n")
        executeOriginalCommand(argv) # might try this for now
    elif any({"make", "ninja", "MSBuild"}, lambda x: x in os.path.basename(argv[0])):
        runBuildCommand(argv)
    else:
        new_cmd = ' '.join(argv)
    
    try:
        cmdOutput = subprocess.run(new_cmd, shell=True, check=True, env=env)
    except Exception as e:
        prRed(e)
        raise Exception(new_cmd) from e



def executeOriginalCommand(argv: list) -> None:
    try:
        subprocess.run(' '.join(argv), shell=True, check=True)
    except subprocess.CalledProcessError as e:
        prRed(e)




def main(argv: list) -> None:
    try:
        runCommandWithFlags(argv[1:])
    except Exception as e: # Fall back to original command
        prRed(e)
        executeOriginalCommand(argv[1:])



if __name__ == '__main__':
    main(sys.argv)
  