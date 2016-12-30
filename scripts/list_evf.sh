#!/bin/sh

for f in `cut -d , -f 2 data/$1.csv | sort -u`; do
  echo "_csoportositas(evf_${f}.html,${f}. évfolyam)"
done


