#!/usr/bin/env bash

[[ $# != 3 ]] && echo "+ \"Error\" Nop" && exit
for i in $(jot $1 $2); do
  echo -n "+ \"Layer $i";
  case $i in
    2) echo -n " (bottom)";;
    4) echo -n " (normal)";;
    6) echo -n " (top)";;
  esac;
  if [[ $i == $3 ]]; then
    echo " **\" Nop";
  else
    echo "\" Pick Layer 0 $i";
  fi;
done;

