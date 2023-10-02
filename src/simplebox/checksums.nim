import os
import rdstdin
import terminal
import strutils
import checksums/md5
import checksums/sha2
import checksums/sha1


proc getSum(t: string, file: string): string =
  # returns the sum.
  var content: string
  
  content = file
  
  if fileExists(file):
    content = readFile(file)

  case t:
    of "sha1":
      return $sha1.secureHash(content)
    of "sha256":
      return $sha2.secureHash(Sha_256, content)
    of "sha512":
      return $sha2.secureHash(Sha_512, content)
    of "sha384":
      return $sha2.secureHash(Sha_384, content)
    of "sha224":
      return $sha2.secureHash(Sha_224, content)
    of "md5":
      return $toMD5(content)

proc checker(t: string, file: string): int =
  # Checks sums.
  # Returns the amount of failed sums.

  var sum: seq[string]
  var failCount: int
  var content: string
  
  if not fileExists(file):
    content = file
  else:
    content = readFile(file)

  for i in content.split("\n"):
    sum = i.split("  ")
    if sum[0].toLower == getSum(t, sum[1]).toLower:
      echo sum[1]&": OK"
    else:
      echo sum[1]&": FAIL"
      inc(failCount)
  
  return failCount

proc shaCommon*(t: string, check: bool, file: seq[string]) =
  # Common proc for sum commands.
  var sums: seq[string]
  var strStdin: string

  if not isatty(stdin) or file.join("") == "-" or isEmptyOrWhitespace(file.join("")):
      try:
        strStdin = readLineFromStdin("")
      except: discard
      if check:
        let chk = checker(t, strStdin)
        if chk != 0:
          echo t&"sum: WARNING: "&($chk)&" computed checksum did NOT match"
          quit(1)
        return
      else:
        sums = sums&(getSum(t, strStdin)&"  -") 
  
  for i in file: 
    if check:
      let chk = checker(t, i)
      if chk != 0:
        echo t&"sum: WARNING: "&($chk)&" computed checksum did NOT match"
        quit(1)
    else:
      sums = sums&(getSum(t, i)&"  "&i)
  
  if not check:
    echo sums.join("\n")

proc sha1sum*(check = false, file: seq[string]) =
  ## Returns or checks SHA1 checksums.
  shaCommon("sha1", check, file)

proc sha256sum*(check = false, file: seq[string]) =
  ## Returns or checks SHA256 checksums.
  shaCommon("sha256", check, file)

proc sha224sum*(check = false, file: seq[string]) =
  ## Returns or checks SHA224 checksums.
  shaCommon("sha224", check, file)

proc sha384sum*(check = false, file: seq[string]) =
  ## Returns or checks SHA384 checksums.
  shaCommon("sha384", check, file)

proc sha512sum*(check = false, file: seq[string]) =
  ## Returns or checks SHA512 checksums.
  shaCommon("sha512", check, file)

proc md5sum*(check = false, file: seq[string]) =
  shaCommon("md5", check, file)
