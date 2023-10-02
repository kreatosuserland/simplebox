import os
import rdstdin
import ../other

proc tee*(append = false, files: seq[string]) {.registerProc.} =
  ## Copy stdin to each file
  var stdinput: string
  try:
    stdinput = readLineFromStdin("")
  except:
    return
  
  echo stdinput

  for file in files:
    if append:
      if not fileExists(file):
        writeFile(file, "")
      let f = open(file, mode = fmAppend)
      write(f, stdinput&"\n")
      close(f)
    else:
      writeFile(file, stdinput&"\n")
