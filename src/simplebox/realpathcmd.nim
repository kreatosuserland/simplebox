import os
import ../other

proc realpath*(path: seq[string]) {.registerProc.} =
  ## Print absolute path of a file/directory.
  if path.len == 0:
    echo "realpath: missing pathname"
    quit(1)

  for i in path:
    echo absolutePath(i)
