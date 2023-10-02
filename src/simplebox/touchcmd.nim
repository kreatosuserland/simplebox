import ../other

proc touch*(file: seq[string]) {.registerProc.} =
    ## Update the access and modification times of each FILE to the current time.
    if file.len == 0:
        echo "touch: missing file argument"
        quit(1)
    for i in file:
        writeFile(i, "")
