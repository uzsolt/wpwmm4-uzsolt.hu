#!/bin/sh

IFS="|"
DIR=`echo ${1} | sed "s,/[^/]*,/static/stuff,"`
DATAFILE=data/${1}.psv
cat ${DATAFILE} | while read txt path tooltip; do
  echo "_own_pdf(\`${txt}',\`${DIR}/${path}',\`${tooltip}')"
done

