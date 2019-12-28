#!/bin/sh

. scripts/functions

VIDEOURL="http://video.uzsolt.hu"
CATEGORY=`echo ${1} | sed "s,.*/,,"`

process() {
  POSTER=$(echo ${url} | sed "s,\(.*\)\..*,\1.jpg,")
  if echo "${source}" | grep -q "^txt://"; then
    source=$(echo ${source} | sed 's,^txt://\(.*\),<em>(\1)</em>,')
  else
    source=$(printf "<a href=\"%s\">(eredeti)</a>" "${source}")
  fi
  printf "\t<div class=\"video\">\n"
  printf "\t\t<div class=\"videotitle\">%s %s</div>\n" "${title}" "${source}"
  printf "\t\t<video controls poster=\"%s/%s/%s\">\n" "${VIDEOURL}" "${CATEGORY}" "${POSTER}"
  printf "\t\t\t<source src=\"%s/%s/%s\">\n" "${VIDEOURL}" "${CATEGORY}" "${url}"
  if [ -n "${subtitle}" ]; then
    printf "\t\t\t<track label=\"Hungarian\" kind=\"subtitles\" srclang=\"%s\" src=\"%s\" default>\n" \
      "${subtitle}" "$(echo ${url} | sed "s,\(.*\)\..*,\1.hu.vtt,")"
  fi
  printf "\t\t</video>\n"
  printf "\t</div>\n"
}

grep "${2}" data/$1.psv | read_data_stdin process url source title subtitle
