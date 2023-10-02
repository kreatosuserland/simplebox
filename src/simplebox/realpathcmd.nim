import os

proc realpath*(path: seq[string]) =
  ## Print absolute path of a file/directory.
  if path.len == 0:
    echo "realpath: missing pathname"
    quit(1)

  for i in path:
    echo absolutePath(i)
