import os
import ../other

proc pwd*() {.registerProc.} =
  ## Get current directory.
  echo getCurrentDir()
