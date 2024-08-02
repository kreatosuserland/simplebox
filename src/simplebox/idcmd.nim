import strutils
import std/posix
import ../other

proc id*(group = false, groups = false, name = false, real = false, user = false, zero = false) {.registerProc.} =
    ## Returns the user ID of the current session.
    
    if user:
        echo ($getuid())
    else:
        echo "uid="&($getuid())&"("&($getlogin())&") gid="&($getgid())&"("&($getlogin())&")"#&"groups:"
