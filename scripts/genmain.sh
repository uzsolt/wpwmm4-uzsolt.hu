#!/bin/sh

. scripts/functions

echo "<h1>Frissítések, újdonságok</h1>"
echo '<a href="/feed.xml" class="rss">
  <img src="/static/rss.png" alt="RSS feed" title="RSS feed">
</a>'
if [ "$1" == "all" ]; then
  echo "(összes hír megjelenítve)"
else
  echo "<a href=/news.html>(összes hír)</a>"
  TAIL_PARAMS="-n 20"
fi

process() {
  printf '  <a href="%s"><div class="note_stuff" title="%s">\n' "${url}" "${title}"
  printf '    <span class="note_date">%s</span><span class="note_title">%s</span>\n' "${date}" "${descr}"
  printf '  </div></a>\n'
}

tail -r ${TAIL_PARAMS} data/news.psv | read_data_stdin process date descr url
