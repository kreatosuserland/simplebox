import cligen
import other
include imports
import strutils
import cligen/parseopt3

clCfg.version = "simplebox v1.0-prealpha"

proc printHelp() =
  echo """      _               _       _              
  ___(_) _ __   _ __ | | ___ | |__  ___ __ __
 (_-<| || '  \ | '_ \| |/ -_)| '_ \/ _ \\ \ /
 /__/|_||_|_|_|| .__/|_|\___||_.__/\___//_\_\
               |_|                           
  """
  
  echo "Simple core utilities written in Nim."
  
  echo "Usage: simplebox [command [arguments]...]"
  echo "Or: command [arguments]... (when is the same name as command)\n"

proc main(command = "") =
  # Main function.
  var cmd: string
  var params = commandLineParams()

  if not isEmptyOrWhitespace(command):
    cmd = command
  else:
    for kind, key, val in getopt():
      cmd = key
      break
    if params.len > 0:
      params.del(0)

  case cmd:
    of "yes":
      dispatchCf(yes, cmdLine = params)
    of "basename":
      dispatchCf(basename, short={"multiple" : 'a'}, cmdLine = params)
    of "touch":
      dispatchCf(touch, cmdLine = params)
    of "mv":
      dispatchCf(mv, cmdLine = params)
    of "rm":
      dispatchCf(rm, cmdLine = params)
    of "ls":
      dispatchCf(ls, cmdLine = params)
    of "echo":
      dispatchCf(secho, cmdName = "echo", cmdLine = params)
    of "cat":
      dispatchCf(cat, help = { "u": "(ignored)" }, cmdLine = params)
    of "cp":
      dispatchCf(cp, cmdLine = params)
    of "head":
      dispatchCf(head, cmdLine = params)
    of "mkdir":
      dispatchCf(mkdir, cmdLine = params)
    of "chroot":
      dispatchCf(chroot, cmdLine = params)
    of "whoami":
      dispatchCf(whoami, cmdLine = params)
    of "rmdir":
      dispatchCf(rmdir, cmdLine = params)
    of "nproc":
      dispatchCf(nproc, cmdLine = params)
    of "realpath":
      dispatchCf(realpath, cmdLine = params)
    of "pwd":
      dispatchCf(pwd, cmdLine = params)
    of "true":
      dispatchCf(trueCommand, cmdName = "true", cmdLine = params)
    of "false":
      dispatchCf(falseCommand, cmdName = "false", cmdLine = params)
    of "ln":
      dispatchCf(ln, cmdLine = params)
    of "uname":
      dispatchCf(unameCommand, cmdName = "uname", cmdLine = params)
    of "sleep":
      dispatchCf(sleepCommand, cmdName = "sleep", cmdLine = params)
    of "":
      printHelp()
      quit(0)
    else:
      echo "simplebox: applet "&cmd&" not found"
      quit(1)

if getExecutableNameEx() != "simplebox":
  main(getExecutableNameEx())
else:
  main()
