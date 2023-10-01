import os
import cligen
import simplebox/echocmd
import simplebox/basenamecmd
import simplebox/touchcmd
import simplebox/yescmd
import simplebox/catcmd
import simplebox/rmcmd
import simplebox/mvcmd
import simplebox/cpcmd
import simplebox/lscmd
import simplebox/headcmd
import simplebox/mkdircmd
import simplebox/chrootcmd
import simplebox/whoamicmd
import simplebox/rmdircmd

clCfg.version = "simplebox v1.0-alpha"

if getAppFilename() == "yes":
  dispatch(yes)

dispatchMulti(
    [
    yes
    ],
    [
    touch
    ],
    [
    mv
    ],
    [
    rm
    ],
    [
    ls
    ],
    [
    basename,
    short={"multiple" : 'a'}
    ],
    [
    secho,
    cmdName="echo"
    ],
    [
    cat, help = { "u": "(ignored)" }
    ],
    [
    cp
    ],
    [
    head
    ],
    [
    mkdir
    ],
    [
    chroot
    ],
    [
    whoami
    ],
    [
    rmdir
    ]
)
