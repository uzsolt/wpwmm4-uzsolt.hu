#!/bin/sh

# Parameters:
# $1 - filename (without data/ directory)
# $2 - optional, which field
# $3 - the value

# field 1 => tanev
# field 2 => evfolyam

if [ -n "$2" ]; then
  AWKSTR="\$$2==$3 {print \$0}"
else
  AWKSTR="{print \$0}"
fi
echo ${AWKSTR}

IFS="|"
cat data/$1 | awk -F "${IFS}" ${AWKSTR} | while read tanev evf descr path; do
  tanevstr="${tanev}-$((tanev+1)). tanév"
  echo "_verseny_pdf(\`${path}',\`${tanevstr}',\`${evf}',\`${descr}')"
done
