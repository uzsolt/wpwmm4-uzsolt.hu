#!/bin/sh

. scripts/functions
echo '<table id="note_table">'
int=0

process() {
  printf '   <tr class=row%s>\n' "$((int+1))"
  printf '    <td class=col_date>%s</td>\n' "${date}"
  printf '    <td class=col_href><a href="%s" title="%s">%s</a></td>\n' "${url}" "${descr}" "${title}"
  printf '    <td class=col_desc>%s</td>\n' "${descr}"
  printf '   </tr>\n'
  int=$(((int+1)%2))
}

read_data data/${1}.psv process title descr date url

echo '  </table>'
