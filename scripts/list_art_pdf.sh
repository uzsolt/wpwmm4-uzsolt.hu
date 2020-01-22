#!/bin/sh

. scripts/functions

BASEURL=`echo "$1" | sed "s,edu,/static/stuff,"`
process() {
  date=$(echo ${url} | sed "s,\(..\)\(..\).*,\1/\2,")
  printf "\
    <div class='drow'>
      <div class='dcell'>%s</div>
      <div class='dcell art_author'>%s</div>
      <div class='dcell art_title'><a href='${BASEURL}/%s'>%s</a></div>
    </div>\n" "${date}" "${author}" "${url}" "${title}"
}

cat << EOF
<div class=dtable>
  <div class=dheading>
    <div class=dcell>szám</div>
    <div class=dcell>szerző(k)</div>
    <div class=dcell>cím</div>
  </div>
EOF

cat data/$1.psv | read_data_stdin process url author title

printf '</div>\n'
