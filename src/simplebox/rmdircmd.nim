import os
import ../other

proc rmdir*(directories: seq[string]) {.registerProc.} =
  ## Remove directories.
  for i in directories:
    removeDir(i)
