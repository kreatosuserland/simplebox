import posix
import ../other

proc tty*() {.registerProc.} =
  ## Returns the current tty.
  echo ttyname(STDIN_FILENO)
