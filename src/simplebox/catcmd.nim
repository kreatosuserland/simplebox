proc cat*(file: seq[string]) =
    ## Output file contents to standard output.

    if file.len == 0:
        echo "cat: missing file argument"
        quit(1)

    echo readAll(open(file[0]))
