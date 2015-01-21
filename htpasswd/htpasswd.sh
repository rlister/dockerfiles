#!/bin/sh

## make sure output dir exists
dir=$(dirname $OUTPUT)
if [ ! -d $dir ] ; then
  mkdir -p $dir
fi

## loop user:pass args
for arg in $* ; do
  user=$(echo ${arg%%:*})
  pass=$(echo ${arg##*:})
  printf "${user}:$(openssl passwd -$CRYPT $pass)\n" >> $OUTPUT
done
