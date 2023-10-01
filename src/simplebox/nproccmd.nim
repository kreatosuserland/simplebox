import std/cpuinfo

proc nproc*(all = false) =
  ## Return available processing units.
  echo countProcessors()
