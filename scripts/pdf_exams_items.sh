#!/bin/sh

IFS="|"
DIR=`echo ${1}${2} | sed "s,/[^/]*,/static/stuff,"`
cat data/${1}/${2}.psv | while read txt path tooltip; do
  echo "_own_pdf(\`${txt}',\`${DIR}/${path}',\`${tooltip}')"
done
