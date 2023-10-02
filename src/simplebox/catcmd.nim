import std/rdstdin
import std/terminal
import std/strutils
import std/os
import ../other

proc cat*(u = false, file: seq[string]) {.registerProc.} =
    ## Output file contents to standard output.
    
    if not isatty(stdin) or file.join("") == "-" or isEmptyOrWhitespace(file.join("")):
        try:
          echo readLineFromStdin("")
        except:
          discard
        quit(0)

    if file.len == 0 and isatty(stdin):
        echo "cat: missing file argument"
        quit(1)
    
    for i in file:      
      if not fileExists(i):
        echo "cat: file "&i&" doesn't exist"
      else:
        echo readAll(open(i))
