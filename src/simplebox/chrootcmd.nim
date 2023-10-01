proc chroot*(newroot: string, command: seq[string]) =
  ## Change ROOT to NEWROOT, and execute COMMAND.
