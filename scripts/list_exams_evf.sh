#!/bin/sh

# $1 - tantárgy, edu/ előtaggal
for f in `ls data/$1/*.psv | egrep '[0-9]+\.psv'`; do
  evf=$(echo $f | sed "s,.*\([0-9][0-9]\).psv,\1,g")
  echo "_csoportositas(\`${evf}.html',\`${evf}. évfolyam')"
done

if [ "${1}" = "edu/math/exams" ]; then
  echo "_csoportositas(\`erettsegi.html',\`Érettségi feladatsorok')"
fi
