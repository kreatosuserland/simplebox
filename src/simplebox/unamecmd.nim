import posix_utils
import strutils

proc append(v: string, t: string): string =
  # Internal proc
  if isEmptyOrWhitespace(v):
    return t
  else:
    return v&" "&t

proc unameCommand*(a = false, m = false, n = false, r = false, s = false, v = false) =
  ## Return system name.
  var final: string
  var unameInfo = uname()

  # this looks bad lol but idk how else can i make this
  if s or a or (not a and not m and not n and not r and not v):
    final = unameInfo.sysname
  
  if n or a:
    final = append(final, unameInfo.nodename)
  
  if r or a:
    final = append(final, unameInfo.release)

  if v or a:
    final = append(final, unameInfo.version)

  if m or a:
    final = append(final, unameInfo.machine)
  
  echo final
