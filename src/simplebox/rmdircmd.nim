import os

proc rmdir*(directories: seq[string]) =
  # Remove directories.
  for i in directories:
    removeDir(i)
