#!/bin/sh

IFS='|'
cat << EOF
<h1>Frissítések, újdonságok</h1>
<table id="news">
EOF

tail -r -n 20 data/news.psv | while read date descr url; do
  printf '  <tr>\n'
  printf '    <td>%s</td>\n' "`date -j -f '%Y-%m-%d' "${date}" +'%Y. %m. %d.'`"
  printf '    <td><a href="%s">%s</a></td>\n' "${url}" "${descr}"
  printf '  </tr>\n'
done

echo '</table>'
