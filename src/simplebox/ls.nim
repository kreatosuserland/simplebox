import algorithm
import terminal

proc coloredEcho(file: string) =
    if fileExists(file):
        stdout.write(file&"  ")
    elif dirExists(file):
        stdout.styledWrite(styleBright, fgBlue, file&"  ")

proc ls(all = false, color = false, files: seq[string]) =
    ## List information about files
    try:
        var fileResult: seq[string]
        var files = files

        if files.len == 0:
            files = toSeq(["."])

        for file in files:
            
            if fileExists(file):
                
                if fileResult.len == 0:
                    fileResult = toSeq([lastPathPart(file)])
                else:
                    fileResult = fileResult&lastPathPart(file)
        
            for i in walkDir(file, checkDir = true):
                if isHidden(i.path) and not all:
                    continue
                else:
                    if fileResult.len == 0:
                        fileResult = toSeq([lastPathPart(i.path)])
                    else:
                        fileResult = fileResult&lastPathPart(i.path)
                
        if not color:
            echo fileResult.sorted(system.cmp[string]).join("  ")
        else:
            for i in fileResult.sorted(system.cmp[string]):
                coloredEcho(i)
            
            stdout.write("\n")
    
    except OSError:
        echo "ls: directory or file doesn't exist"
        quit(1)
