proc getExecutableNameEx*(): string =
  # Gets the executable name.
  # Doesn't resolve symlinks.
  let file = open("/proc/self/comm")
  let res = readLine(file)
  close(file)
  return res
