import cligen
#import other
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
import simplebox/falsecmd
import simplebox/truecmd
import simplebox/lncmd
import simplebox/unamecmd
import simplebox/sleepcmd

clCfg.version = "simplebox v1.0-prealpha"

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
    ],
    [
    trueCommand,
    cmdName="true"
    ],
    [
    falseCommand,
    cmdName="false"
    ],
    [
    ln
    ],
    [
    unameCommand,
    cmdName="uname"
    ],
    [
    sleepCommand,
    cmdName="sleep"
    ]
)
