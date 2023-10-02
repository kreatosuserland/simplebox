import os
import strutils
#import terminal
import rdstdin
import ../other

proc tailInternal(n: int, content: string) =
  # Internal proc.
  let lineCount = countLines(content)
  if lineCount >= n: 
    for i in lineCount - n ..< lineCount:
      stdout.write(content.split("\n")[i])
      if i != lineCount - 1:
        echo ""
  elif lineCount <= n:
    stdout.write(content)
  

proc tail*(n = 10, files: seq[string]) {.registerProc.} =
    ## Copy the first part of FILES.
    if isEmptyOrWhitespace(files.join("")) or files.join("") == "-":
        try:
          tailInternal(n, readLineFromStdin(""))
        except: discard
        return

    for i in files:
      if fileExists(i):
        tailInternal(n, readFile(i))
      else:
        echo "tail: couldn't open '"&i&"': No such file or directory"
