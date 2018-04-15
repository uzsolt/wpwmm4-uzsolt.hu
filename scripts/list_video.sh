#!/bin/sh

. scripts/functions

VIDEOURL="http://video.uzsolt.hu"
CATEGORY=`echo $1 | sed 's,.*/,,'`

process() {
  POSTER=$(echo ${url} | sed "s,\(.*\)\..*,\1.jpg,")
  printf "\t<a href=\"${url}.html\"><div class=\"video_thumb\">\n"
  printf "\t\t<img src=\"${VIDEOURL}/${CATEGORY}/${POSTER}\" alt=\"${title}\" width=\"128\">\n"
  printf "\t\t<div class=\"video_desc\">${title}</div>\n"
  printf "\t</div></a>\n"
}

cat data/$1.psv | read_data_stdin process url source title
