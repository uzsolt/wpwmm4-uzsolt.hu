#!/bin/sh

. scripts/functions

cat << EOF
<h1>Frissítések, újdonságok</h1>
<table id="news">
EOF

process() {
  printf '  <a href="%s"><div class="note_stuff" title="%s">\n' "${url}" "${title}"
  printf '    <span class="note_date">%s</span><span class="note_title">%s</span></br>\n' "${date}" "${descr}"
  printf '  </div></a>\n'
}

tail -r -n 20 data/news.psv | read_data_stdin process date descr url
