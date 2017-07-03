#!/bin/sh

. scripts/functions

cat << EOF
<h1>Frissítések, újdonságok</h1>
<table id="news">
EOF

process() {
  printf '  <tr>\n'
  printf '    <td>%s</td>\n' "`date -j -f '%Y-%m-%d' "${date}" +'%Y. %m. %d.'`"
  printf '    <td><a href="%s">%s</a></td>\n' "${url}" "${descr}"
  printf '  </tr>\n'
}

tail -r -n 20 data/news.psv | read_data_stdin process date descr url

echo '</table>'
