#!/bin/sh

. scripts/functions
int=0

process() {
  printf '  <a href="%s"><div class="note_stuff" title="%s">\n' "${url}" "${title}"
  printf '    <span class="note_date">%s</span><span class="note_title">%s</span></br>\n' "${date}" "${title}"
  printf '    <div class="note_descr">%s</div>\n' "${descr}"
  printf '  </div></a>\n'
}

read_data data/${1}.psv process title descr date url
