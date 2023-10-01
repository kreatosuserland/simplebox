import os
import strutils
#import terminal
import rdstdin

proc headInternal(n: int, content: string) =
  # Internal proc.
  var lineCount = countLines(content)
  echo content
  if lineCount >= n: 
    for i in 0..n:
      echo i
  elif lineCount <= n:
    stdout.write(content)
  

proc head*(n = 10, files: seq[string]) =
    ## Copy the first part of FILES.
    if isEmptyOrWhitespace(files.join("")) or files.join("") == "-":
        headInternal(n, readLineFromStdin(""))
        return

    for i in files:
      if fileExists(i):
        headInternal(n, readFile(i))
      else:
        echo "head: couldn't open '"&i&"': No such file or directory"
