import os
import strutils
import sequtils
import posix

proc strtol*(nptr: cstring; endptr: cstringArray; base: cint): clong {.importc, header: "<stdlib.h>", sideEffect, raises: [], tags: [], forbids: [].}

proc chmodInternal(file: string, permission: string) =
  # Internal proc.
  let res = chmod(file, strtol(permission, allocCStringArray(["0"]), 8).Mode)
  if res < 0:
    let err = $strerror(errno)
    echo "chmod: failed: "&err
    quit(1)

proc chmodCommand*(recursive = false, fileAndPermission: seq[string]) =
  ## Change permissions.
  
  if fileAndPermission.len < 2:
    echo "chmod: missing file and/or permission"
    quit(1)

  let file = fileAndPermission[1]
  let permission = fileAndPermission[0]

  if recursive and dirExists(file):
    for i in toSeq(walkDirRec(file, {pcFile, pcLinkToFile, pcDir, pcLinkToDir})):
      chmodInternal(i, permission)
  
  chmodInternal(file, permission)
