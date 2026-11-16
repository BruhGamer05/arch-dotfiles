#!/usr/bin/env bash
cd ~/arch-dotfiles || exit 1
./update-pkglist.sh
git add -A
git diff --cached --quiet && exit 0
git commit -m "auto: $(date '+%F %H:%M')"
git push origin master
