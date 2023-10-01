import std/rdstdin
import std/terminal
import std/strutils
import std/os

proc cat*(u = false, file: seq[string]) =
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
        echo "cat: file doesn't exist"
        quit(1)

      echo readAll(open(i))
