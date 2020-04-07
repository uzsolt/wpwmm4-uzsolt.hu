#!/bin/sh

. scripts/functions
DIR=`echo _STUFFURL/${1}`
process() {
  echo "_own_pdf(\`${txt}',\`${DIR}/${path}',\`${tooltip}')"
}

read_data data/${1}.psv process txt path tooltip
