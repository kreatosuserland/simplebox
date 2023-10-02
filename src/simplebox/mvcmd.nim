import os
import ../other

proc mv*(files: seq[string]) {.registerProc.} =
    ## Move FILE or DIRECTORY into desired DIRECTORY or FILE.
    if files.len != 2:
        echo "mv: not enough arguments"
        quit(1)
    
    try:
        if dirExists(files[0]):
            moveDir(files[0], files[1])
        else:
            moveFile(files[0], files[1])
    except Exception:
        echo "mv: move failed"
        quit(1)
