#!/usr/bin/env python
import sys,os
from os.path import join, getsize

def nameCheck(dpath, bufStr):
    old = bufStr
    new = bufStr.lower()

    blacklist = [
            ')','(',',','\'','&',' ','[',']',
            ]
    ignorelist = [
            '',
            ]       

    if any(bl in new for bl in blacklist) or new != old:
        for ch in new:
            if ch in blacklist:
                new = new.replace(ch, '_')
        os.rename(join(dpath,old),join(dpath,new))


def main():
    for dirpath, dirs, files in os.walk(sys.argv[1],topdown=True):
        for d in dirs:
            nameCheck(dirpath, d)
        for f in files:
            nameCheck(dirpath, f)

if __name__ == "__main__":
    main()
