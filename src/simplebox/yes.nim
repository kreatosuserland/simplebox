import sequtils
import strutils

proc yes(string: seq[string]) =
  ## Repeatedly output a line with all specified STRING(s), or 'y'.

  var mainString: seq[string]

  if string.len == 0:
    mainString = toSeq(["y"])
  else:
    mainString = string

  while true:
    echo mainString.join(" ")
