proc basename(name: seq[string]) =
    ## Return non-directory portion of a pathname removing suffix.
    if name.len == 0:
        echo "basename: missing name argument"
        quit(1)
    echo lastPathPart(name[0])
