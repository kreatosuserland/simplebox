import os
import ../other

proc mkdir*(directory: seq[string]) {.registerProc.} =
  ## Create directories.
  if directory.len == 0:
    echo "mkdir: missing directory name"
    quit(1)

  for i in directory:
    try:
      createDir(i)
    except Exception:
      echo "mkdir: couldn't create "&i
      quit(1)
