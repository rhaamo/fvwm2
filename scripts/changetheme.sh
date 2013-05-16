#!/usr/bin/env bash
# $1 = themes directory
#for i in "$1"/*; do
for i in $(find $1/ -mindepth 1 -maxdepth 1 -type d); do
  echo " + \"%appearance.png%$(basename ${i})\" ChangeTheme \"$(basename ${i})\"";
done
