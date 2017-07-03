#!/bin/sh

. scripts/functions

# Parameters:
# $1 - filename (without data/ directory and .psv suffix)
# $2 - optional, which field
# $3 - the value

process() {
  tanevstr="${tanev}-$((tanev+1))"
  printf "_verseny_pdf(\`\`%s\'\',\`\`%s\'\',\`\`%s\'\',\`\`%s\'\')\n" \
    "${DIR}/${path}" \
    "${tanevstr}" \
    "${evf}" \
    "${descr}"
}

# field 1 => tanev
# field 2 => evfolyam
if [ -n "$2" ]; then
  AWKSTR="\$$2==\"$3\" {print \$0}"
else
  AWKSTR="{print \$0}"
fi

DIR=`echo ${1} | sed "s,[^/]*,/static/stuff,"`
IFS="|"
cat data/$1.psv | awk -F "${IFS}" "${AWKSTR}" | read_data_stdin process tanev evf descr path
