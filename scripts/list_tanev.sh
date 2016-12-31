#!/bin/sh

for f in `cut -d \| -f 1 data/$1.psv | sort -u`; do
  echo "_csoportositas(${f}.html,${f}-$((f+1)). tanév)"
done

