import posix
import ../other

proc whoami*() {.registerProc.} =
  ## Returns the current username.
  echo getlogin()
