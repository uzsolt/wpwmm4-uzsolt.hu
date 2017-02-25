#!/bin/sh

IFS="|"
echo '<table id="note_table">'
int=0
cat data/${1}.psv | while read title descr date url; do
  printf '   <tr class=row%s>\n' "$((int+1))"
  printf '    <td class=col_date>%s</td>\n' "${date}"
  printf '    <td class=col_href><a href="%s" title="%s">%s</a></td>\n' "${url}" "${descr}" "${title}"
  printf '    <td class=col_desc>%s</td>\n' "${descr}"
  printf '   </tr>\n'
  int=$(((int+1)%2))
done
echo '  </table>'
