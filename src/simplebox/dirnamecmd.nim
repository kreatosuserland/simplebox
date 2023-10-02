import os
import ../other

proc dirname*(paths: seq[string]) {.registerProc.} =
  ## Output each path with last non-slash component and trailing slashes removed
  if paths.len == 0:
    echo "dirname: missing path(s)"
    quit(1)

  for path in paths:
    echo parentDir(path)
