#!/usr/bin/env python

import os

cmds = ["git submodule update --init",
        "git checkout -B purcell",
        "git remote add purcell https://github.com/purcell/emacs.d.git",
        "git fetch purcell",
        "git branch --set-upstream-to=purcell/master purcell",
        "git checkout master"]

for cmd in cmds:
    if os.system(cmd):
        print "Error:" + cmd
        break

