import cligen
import other
include imports
import strutils
import cligen/parseopt3

clCfg.version = "simplebox v1.0-prealpha"

#[ 
  I wanted to put this inside the pragma, but couldn't.
  I am sure it is possible, LMK if you can teach me lol i give up.
]#

changeProcName("Command", "")

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
  echo "Functions:"
  var i: int
  var t: int
  for c in commandList:
    inc(t)
    if commandList.len == t:
      echo(c)
    else:
      stdout.write(c&", ")

    if i == 13:
      i = 0
      stdout.write("\n")
      continue
    inc(i)

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
      params.delete(0)
  
  case cmd:
    of "yes":
      dispatchEx(yes)
    of "basename":
      dispatchEx(basename, shrt={"multiple" : 'a'})
    of "cp":
      dispatchEx(cp)
    of "touch":
      dispatchEx(touch)
    of "mv":
      dispatchEx(mv)
    of "sha1sum":
      dispatchEx(sha1sum)
    of "sha256sum":
      dispatchEx(sha256sum)
    of "sha512sum":
      dispatchEx(sha512sum)
    of "sha224sum":
      dispatchEx(sha224sum)
    of "sha384sum":
      dispatchEx(sha384sum)
    of "md5sum":
      dispatchEx(md5sum)
    of "rm":
      dispatchEx(rm)
    of "ls":
      dispatchEx(ls)
    of "chmod":
      dispatchEx(chmodCommand, cmd = "chmod")
    of "echo":
      dispatchEx(echoCommand, cmd = "echo")
    of "cat":
      dispatchEx(cat, helpInfo = { "u": "(ignored)" })
    of "head":
      dispatchEx(head)
    of "tail":
      dispatchEx(tail)
    of "mkdir":
      dispatchEx(mkdir)
    of "chroot":
      dispatchEx(chroot)
    of "whoami":
      dispatchEx(whoami)
    of "rmdir":
      dispatchEx(rmdir)
    of "nproc":
      dispatchEx(nproc)
    of "realpath":
      dispatchEx(realpath)
    of "pwd":
      dispatchEx(pwd)
    of "true":
      dispatchEx(trueCommand, cmd = "true")
    of "false":
      dispatchEx(falseCommand, cmd = "false")
    of "ln":
      dispatchEx(ln)
    of "uname":
      dispatchEx(unameCommand, cmd = "uname")
    of "sleep":
      dispatchEx(sleepCommand, cmd = "sleep")
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
