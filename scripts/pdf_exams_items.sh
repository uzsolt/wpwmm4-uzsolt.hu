#!/bin/sh

. scripts/functions

if echo "${1}" | grep -q '/math/'; then
  title="Matematika"
else
  title="Fizika"
fi
title="${title} feladatsorok"

printf '<h1>%s</h1>\n' "${title}"
printf '<h2>%s. évfolyam</h2>\n' ${2}
DIR=`echo ${1}${2} | sed "s,/[^/]*,/static/stuff,"`
process() {
  echo "_own_pdf(\`${txt}',\`${DIR}/${path}',\`${tooltip}')"
}

read_data data/${1}/${2}.psv process txt path tooltip
