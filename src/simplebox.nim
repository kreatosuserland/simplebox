import os
import cligen
include simplebox/echo
include simplebox/basename
include simplebox/touch
include simplebox/yes
include simplebox/cat
include simplebox/rm
include simplebox/mv
include simplebox/cp
include simplebox/ls

clCfg.version = "simplebox v1.0-alpha"

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
    basename
    ],
    [
    secho,
    cmdName="echo"
    ],
    [
    cat
    ],
    [
    cp
    ]
)
