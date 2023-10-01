import posix

proc whoami*() =
  ## Returns the current username.
  echo getlogin()
