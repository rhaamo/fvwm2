#!/usr/bin/env bash
[[ $# != 4 ]] && echo "+ \"Error\" Nop" && exit
c=0
for y in $(seq 1 $2); do
  for x in $(seq 1 $1); do
    echo -n "+ \"n°$((c+=1)) ($x x $y)"
    [[ $x = $(($3 + 1)) && $y = $(($4 + 1)) ]] \
      && echo " **\" Nop" || echo "\" MoveToPage $(($x-1)) $(($y-1))"
  done;
done;
