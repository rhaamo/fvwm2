#!/bin/sh

HOSTS=`grep "Host" ~/.ssh/config|cut -d' ' -f 2|uniq|grep -v "^*\."`
for i in ${HOSTS} ; do
    echo "+ \"%terminal.png%${i}\"              Exec $[myssh] ${i}"
done
