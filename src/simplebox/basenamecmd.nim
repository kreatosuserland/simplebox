import os
import strutils
import ../other

proc basename*(multiple = false, suffix = "", zero = false, name: seq[string]) {.registerProc.} =
    ## Return non-directory portion of a pathname removing suffix.
    var suffixFinal: string
    var res: string

    if not isEmptyOrWhitespace(suffix):
      suffixFinal = suffix
    elif name.len > 1 and not multiple:
      suffixFinal = name[1]

    if name.len == 0:
        echo "basename: missing name argument"
        quit(1)
    
    if multiple:
      for i in name:
        if isEmptyOrWhitespace(res):
          res = lastPathPart(i)
        else:
          if zero:
            res = res&lastPathPart(i)
          else:
            res = res&" "&lastPathPart(i)
    else:
      res = lastPathPart(name[0]).replace(suffixFinal, "")
    
    if zero:
      echo res&"\0"
    else:
      echo res
