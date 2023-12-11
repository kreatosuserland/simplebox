import unamecmd
import ../other

proc hostname*() {.registerProc.} =
    ## Prints hostname.
    unameCommand(n = true)