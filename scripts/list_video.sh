#!/bin/sh

. scripts/functions

VIDEOURL="http://video.uzsolt.hu"

process() {
  POSTER=$(echo ${url} | sed "s,\(.*\)\..*,\1.jpg,")
  printf "\t<div class=\"video\">\n"
  printf "\t\t<div class=\"videotitle\">%s <a href=\"%s\">(eredeti)</a></div>\n" "${title}" "${source}"
  printf "\t\t<video controls poster=\"%s/%s\">\n" "${VIDEOURL}" "${POSTER}"
  printf "\t\t\t<source src=\"%s/%s\">\n" "${VIDEOURL}" "${url}"
  printf "\t\t</video>\n"
  printf "\t</div>\n"
}

cat data/$1.psv | read_data_stdin process url source title
