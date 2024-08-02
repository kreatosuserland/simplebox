import strutils
import ../other
import std/osproc
import std/envvars

proc env*(envandcommand: seq[string]): int {.registerProc.} =
    ## Print environment variables.

    for i in envandcommand:
        if "=" in i:
            putEnv(i.split("=")[0], i.split("=")[1])
    #    else:
    #        return execCmdEx(i, options = {poUsePath, poParentStreams, poInteractive}).exitCode
            

    for key, value in envPairs():
        echo key&"="&value

            
