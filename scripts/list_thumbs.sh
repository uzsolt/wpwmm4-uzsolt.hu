#!/bin/sh

IFS="|"
sed -n "\,${1}, s,.*|\(.*\),<center><h2>\1</h2></center>,p" data/menu.psv
cat data/${1}.psv | while read pict descr; do
  printf '  <div class="thumb">\n'
  printf '    <a href="%s"><img width=64 height=64 src="%s" alt="%s"/></a>\n' "${pict}.html" "/static/${1}/thumb/${pict}" "${descr}"
  printf '    <div class="thumb_desc">%s</div>\n' "${descr}"
  printf '  </div>\n'
done
