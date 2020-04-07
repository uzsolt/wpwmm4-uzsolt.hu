#!/bin/sh

. scripts/functions
. scripts/functions-pdf_exams_items

DIR=`echo _STUFFURL/${1}/${2}`
process() {
  echo "_own_pdf(\`${txt}',\`${DIR}/${path}',\`${tooltip}')"
}

create_header $@
read_data data/${1}/${2}.psv process txt path tooltip
