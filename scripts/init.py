#!/usr/bin/env python

import os

cmds = ["git submodule update --init",
        "git remote add purcell https://github.com/purcell/emacs.d.git",
        "git fetch purcell",
        "git checkout purcell/master",
        "git checkout -b purcell",
        "git branch --set-upstream-to=purcell/master purcell",
        "git checkout master"]

for cmd in cmds:
    if os.system(cmd):
        print "Error:" + cmd
        break

