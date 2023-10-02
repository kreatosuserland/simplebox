import os
import osproc
import strutils
import posix

proc chroot(path: cstring): cint {.importc, header: "<unistd.h>", raises: [], tags: [], forbids: [].}

proc chroot*(newrootAndcommand: seq[string]) =
  ## Change ROOT to NEWROOT, and execute COMMAND.
  var nrac = newrootAndCommand 
  let newroot = newrootAndCommand[0]
  
  if not dirExists(newroot):
    echo "chroot: cannot change root directory: No such directory"
    quit(1)

  nrac.del(0)
  var command = nrac.join(" ")
  
  if isEmptyOrWhitespace(command):
    command = "/bin/sh -i" 
  
  setCurrentDir(newroot)
  let ch = chroot(".")
  if ch < 0:
    let err = $strerror(errno)
    echo "chroot: failed: "&err
    quit(1)

  discard execCmd(command)
