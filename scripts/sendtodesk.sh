#!/usr/bin/env bash
[[ $# != 2 ]] && echo "+ \"Error\" Nop" && exit
for i in $(seq 0 $(($1-1))); do
  echo -n "+ \"\$[desk.name$i]"
  [[ $i = $2 ]] && echo " **\" Nop" || echo "\" MoveToDesk 0 $i";
done;
