import os
import strutils
#import terminal
import rdstdin
import ../other

proc headInternal(n: int, content: string) =
  # Internal proc.
  var lineCount = countLines(content)
  if lineCount >= n: 
    for i in 0..n:
      stdout.write(content.split("\n")[i])
      if i != n:
        echo ""
  elif lineCount <= n:
    stdout.write(content)
  

proc head*(n = 10, files: seq[string]) {.registerProc.} =
    ## Copy the first part of FILES.
    if isEmptyOrWhitespace(files.join("")) or files.join("") == "-":
        try:
          headInternal(n, readLineFromStdin(""))
        except: discard
        return

    for i in files:
      if fileExists(i):
        headInternal(n, readFile(i))
      else:
        echo "head: couldn't open '"&i&"': No such file or directory"
