import os
import ../other

proc sleepCommand*(seconds: seq[int]) {.registerProc.} =
  ## Suspend execution for an interval
  var totalSeconds: int

  if seconds.len > 1:
    for i in seconds:
      totalSeconds = totalSeconds + i
  else:
    totalSeconds = seconds[0]

  totalSeconds = totalSeconds * 1000

  sleep(totalSeconds)
