#!/bin/sh

# $1 - tantárgy, edu/ előtaggal
for f in `echo data/$1/*`; do
  evf=$(echo $f | sed "s,.*\([0-9][0-9]\).psv,\1,g")
  echo "_csoportositas(\`${evf}.html',\`${evf}. évfolyam')"
done
