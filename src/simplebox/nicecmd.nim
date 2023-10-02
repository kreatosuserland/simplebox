import os
import osproc
import posix
import ../other
import strutils

proc getpriority*(which: cint; who: Id): cint {.importc, header: "<sys/resource.h>", raises: [], tags: [], forbids: [].}
proc setpriority*(which: cint; who: Id; value: cint): cint {.importc, header: "<sys/resource.h>", raises: [], tags: [], forbids: [].}

proc nice*(n: string = "", command: seq[string]) {.registerProc.} =
  ## Run command with adjussted niceness.
  if command.len == 0:
    let res = $getpriority(0, cuint(getCurrentProcessId()))
    if res == "-1":
      let err = $strerror(errno)
      echo "nice: failed: "&err
    else:
      echo res
  else:
    var finalN: cint
    try:
      finalN = cint(parseInt(n))
    except Exception:
      echo "nice: invalid adjustment '"&n&"'"
      quit(125) 
      
    let res = $setpriority(0, cuint(getCurrentProcessId()), cint(parseInt(n))) # add try for parseInt
    if res == "-1":
      let err = $strerror(errno)
      echo "nice: failed: "&err
    else:
      discard execCmd(command.join(" "))

  #getCurrentProcessId()
