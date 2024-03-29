import os
import osproc
import strutils
import posix
import ../other

proc chroot(path: cstring): cint {.importc, header: "<unistd.h>", raises: [], tags: [], forbids: [].}

proc chroot*(newrootAndcommand: seq[string]) {.registerProc.} =
  ## Change ROOT to NEWROOT, and execute COMMAND.
  
  if newrootAndCommand.len == 0:
    echo "chroot: missing newroot argument"
    quit(1)

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
