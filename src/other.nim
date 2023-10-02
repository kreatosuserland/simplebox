import os
import cligen
import macros
import tables
import strutils

var commandList*: seq[string]

macro registerProc*(p: untyped): untyped =
  result = newTree(nnkStmtList, p)
  
  let procNameAsStr = ($p[0]).replace("*", "")
 
  result.add quote do:
    commandList.add(`procNameAsStr`)

template dispatchEx*(pro: typed{nkSym}, cmd="", shrt: typed = {}, helpInfo: typed = {}): untyped =
  # A wrapper of dispatchCf
  var params = commandLineParams()
  if params.len > 0:
    params.del(0)

  dispatchCf(pro, cmdLine = params, short = shrt, help = helpInfo, cmdName = cmd)

proc changeProcName*(before, after: string) =
  # Changes the proc name on commandList
  commandList = commandList.join(" ").replace(before, after).split(" ")

proc getExecutableNameEx*(): string =
  # Gets the executable name.
  # Doesn't resolve symlinks.
  let file = open("/proc/self/comm")
  let res = readLine(file)
  close(file)
  return res
