#!/bin/sh

. scripts/functions

DIR=`echo ${1}${2} | sed "s,/[^/]*,/static/stuff,"`
process() {
  echo "_own_pdf(\`${txt}',\`${DIR}/${path}',\`${tooltip}')"
}

read_data data/${1}/${2}.psv process txt path tooltip
