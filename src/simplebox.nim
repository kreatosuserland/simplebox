import cligen
include imports

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
    ],
    [
    pwd
    ],
    [
    nproc
    ],
    [
    chmodCommand,
    cmdName="chmod",
    short = { "recursive": 'R' }
    ],
    [
    realpath
    ]
)
