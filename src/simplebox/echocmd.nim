import strutils
import ../other

proc echoCommand*(string: seq[string]) {.registerProc.} =
    ## Echo to standard output.
    echo string.join(" ")
