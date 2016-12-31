#!/bin/sh

for f in `cut -d \| -f 2 data/$1.psv | sort -u`; do
  echo "_csoportositas(${f}.html,${f}. évfolyam)"
done


