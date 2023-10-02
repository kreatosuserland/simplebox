import os
import ../other

proc cp*(files: seq[string]) {.registerProc.} =
    ## Copy FILE into desired directory.
    if files.len != 2:
        echo "cp: not enough arguments"
        quit(1)
    
    try:
        copyFile(files[0], files[1])
    except Exception:
        echo "cp: copy failed"
        quit(1)
