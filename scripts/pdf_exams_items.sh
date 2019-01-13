#!/bin/sh

. scripts/functions
. scripts/functions-pdf_exams_items

DIR=`echo ${1}/${2} | sed "s,/[^/]*,/static/stuff,"`
process() {
  echo "_own_pdf(\`${txt}',\`${DIR}/${path}',\`${tooltip}')"
}

create_header $@
read_data data/${1}/${2}.psv process txt path tooltip
