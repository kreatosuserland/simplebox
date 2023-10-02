import std/cpuinfo
import ../other

proc nproc*(all = false) {.registerProc.} =
  ## Return available processing units.
  echo countProcessors()
