import os
import ../other

proc readlink*(files: seq[string]) {.registerProc.} =
  ## Resolves symlinks and returns original file path
  for file in files:
    if symlinkExists(file):
      echo expandSymlink(file)
