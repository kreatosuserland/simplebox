import sequtils
import strutils
import ../other

proc yes*(string: seq[string]) {.registerProc.} =
  ## Repeatedly output a line with all specified STRING(s), or 'y'.

  var mainString: seq[string]

  if string.len == 0:
    mainString = toSeq(["y"])
  else:
    mainString = string

  while true:
    echo mainString.join(" ")
