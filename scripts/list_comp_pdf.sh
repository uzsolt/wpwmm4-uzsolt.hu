#!/bin/sh

# Parameters:
# $1 - filename (without data/ directory and .psv suffix)
# $2 - optional, which field
# $3 - the value

# field 1 => tanev
# field 2 => evfolyam

if [ -n "$2" ]; then
  AWKSTR="\$$2==\"$3\" {print \$0}"
else
  AWKSTR="{print \$0}"
fi

IFS="|"
DIR=`echo ${1} | sed "s,/[^/]*,/static/stuff,"`
cat data/$1.psv | awk -F "${IFS}" ${AWKSTR} | while read tanev evf descr path; do
  tanevstr="${tanev}-$((tanev+1))"
  echo "_verseny_pdf(\`${DIR}/${path}',\`${tanevstr}',\`${evf}',\`${descr}')"
done
