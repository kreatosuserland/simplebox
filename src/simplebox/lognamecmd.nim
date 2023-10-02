import posix
import ../other

proc logname*() {.registerProc.} =
  ## Returns the user's username.
  echo getpwuid(getuid()).pw_name
  
