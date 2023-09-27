import os

proc rm*(force = false, recursive = false, interactive = false, files: seq[string]) =
    ## Remove files or directories.
    
    if files.len == 0:
        echo "rm: missing operand"
        echo "run rm --help for information"
        quit(1)

    for i in files:

        if dirExists(i) and not recursive:
            echo "rm: cannot remove "&i&": is a directory"
            quit(1)
        else:
            removeDir(i)
            continue

        removeFile(i)
