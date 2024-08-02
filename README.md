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
  comm csplit cut date dd df dircolors du 
  expand expr factor fmt fold groups hostid install
  join kill link mkfifo mknod mktemp nl
  nohup numfmt od paste pathchk pinky pr ptx 
  runcon seq shred shuf sort split stat stdbuf stty sum sync tac 
  timeout tr truncate tsort unexpand uniq
  unlink uptime users vdir wc who
```

Note: This is NOT a full list, and it may not be up-to-date. It also doesn't mean each utility on the list will get into the project.

# Building
Build by running `./build.sh`.
