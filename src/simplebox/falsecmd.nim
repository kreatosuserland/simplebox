import ../other

proc falseCommand*() {.registerProc.} =
 ## Return non-exit status.
 quit(1)
