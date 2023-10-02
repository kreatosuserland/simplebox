import os
import ../other

proc ln*(f = false, s = false, sourceAndDestination: seq[string]) {.registerProc.} =
  ## Create a link.
  
  if sourceAndDestination.len == 0:
    echo "ln: missing source and destination"
    quit(1)

  let destination = sourceAndDestination[1]
  let source = sourceAndDestination[0]

  if (fileExists(destination) or dirExists(destination)) and not f:
    echo "ln: failed to create symbolic link '"&destination&"': File exists"
    quit(1)
  elif f:
    if fileExists(destination):
      removeFile(destination)
    elif dirExists(destination):
      removeDir(destination)

  if s:
    createSymlink(source, destination)
  else:
    createHardlink(source, destination)
