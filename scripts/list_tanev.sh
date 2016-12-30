#!/bin/sh

for f in `cut -d , -f 1 data/$1.csv | sort -u`; do
  echo "_csoportositas(tanev/${f}.html,${f}-$((f+1)). tanév)"
done

