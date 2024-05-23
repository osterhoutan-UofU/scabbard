#!/usr/bin/env python3

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
from exceptions import CommandException, CompileException

# --------------------------------------------------------------------------- #
# --- Installation Paths ---------------------------------------------------- #
# --------------------------------------------------------------------------- #

ADDED_FLAGS = '-fsave-optimization-record'

# --------------------------------------------------------------------------- #
# --- Classes --------------------------------------------------------------- #
# --------------------------------------------------------------------------- #

class Command:
  def __init__(self, cmd):
    self.name = cmd[0]
    self.parameters = cmd[1:]

  def executeOriginalCommand(self):
    try:
      cmd = [self.name] + self.parameters
      subprocess.run(' '.join(cmd), shell=True, check=True)
    except subprocess.CalledProcessError as e:
      prRed(e)

  def getOriginalCommand(self):
    return ' '.join([self.name] + self.parameters[1:])

  def runCommandWithFlags(self):
    new_cmd = [self.name] + ADDED_FLAGS.split() + self.parameters
    new_cmd.insert(0, 'PATH='+os.getenv('FAROS_SAVEDPATH'))
    try:
      cmdOutput = subprocess.run(' '.join(new_cmd), shell=True, check=True)
    except Exception as e:
      prRed(e)
      raise CompileException(new_cmd) from e

if __name__ == '__main__':
  cmd = Command(sys.argv)
  try:
    cmd.runCommandWithFlags()
  except Exception as e: # Fall back to original command
    prRed(e)
    cmd.executeOriginalCommand()