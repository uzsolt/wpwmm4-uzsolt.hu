#!/bin/sh

. scripts/functions

BASEURL=`echo "$1" | sed "s,edu,/static/stuff,"`
process() {
  printf '<a href="%s"><div class="art_stuff">\n' "${BASEURL}/${url}"
  printf '\t<div class="pdf_icon"></div>\n'
  printf '\t<div class="art_stuff_descr"><div class="art_author">%s</div><div class="art_title">%s</div></div>\n' "${author}" "${title}"
  printf '</div></a>\n'
}

cat data/$1.psv | read_data_stdin process url author title
