#!/bin/sh

. scripts/functions
. scripts/functions-pdf_exams_items

DIRECTORY=${1}
FILE=${2}

process_pdf() {
  printf "_own_pdf(\`%s',\`%s',\`%s')\n" \
    "${txt}" "${path}" "${tooltip}"
}

process() {
  printf "<div class='pdfcategory'>"
  printf "<h3>%s</h3>\n" "${title}"
  read_data data/${DIRECTORY}/${files}.psv process_pdf txt path tooltip
  printf "</div>"
}

create_header $@
read_data data/${DIRECTORY}/${FILE}.psv process title files
