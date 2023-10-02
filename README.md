# simplebox
simple coreutils.

Heavily inspired from busybox.

# Current state
This project is in pre-alpha state, use at your own risk.

# Goal
The goal is to have a POSIX-compliant coreutils, while adding some BSD/GNU extensions.

These are left as of now;

```
  b2sum base32 base64 chcon chgrp chown cksum
  comm csplit cut date dd df dircolors dirname du env
  expand expr factor fmt fold groups hostid hostname id install
  join kill link logname mkfifo mknod mktemp nl
  nohup numfmt od paste pathchk pinky pr printenv ptx 
  readlink runcon seq shred shuf sort split stat stdbuf stty sum sync tac 
  tee timeout tr truncate tsort tty unexpand uniq
  unlink uptime users vdir wc who
```

Note: This is NOT a full list, and it may not be up-to-date. It also doesn't mean each utility on the list will get into the project.

# Building
Build by running `./build.sh`.
