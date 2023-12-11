#!/bin/sh
case $1 in
	installDepends)
		nimble install checksums cligen
	;;
	*)
		nim c -o=out/simplebox src/simplebox.nim
	;;
esac
