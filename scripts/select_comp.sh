#!/bin/sh

. scripts/functions

process() {
  printf "\
    <div class='drow'>
      <div class='dcell folder'>_HREF(\`%s\',\`%s\')</div>
      <div class='dcell'>%s</div>
      <div class='dcell'><a href=\"%s\">%s</a></div>
    </div>\n" "${url}" "${name}" "${descr}" "${offurl}" "${offurl}"
}

cat << EOF
<div class=dtable>
  <div class=dheading>
    <div class=dcell>név</div>
    <div class=dcell>információ</div>
    <div class=dcell>hivatalos honlap</div>
  </div>
EOF
grep $1 data/comp_lists.psv | read_data_stdin process url name descr offurl
printf '</div>\n'
