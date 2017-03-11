#!/bin/sh

cat << EOF
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
    <channel>
        <title>Udvari Zsolt honlapja - frissítések</title>
EOF

IFS='|'
indentstr='          '
indentstr2="${indentstr}  "

print_tag() {
  printf '%s<%s>%s</%s>\n' "${indentstr2}" "${1}" "${2}" "${1}"
}

tail -n 20 data/news.psv | while read date descr url; do
  printf '%s<item>\n' "${indentstr}"
  print_tag "title" "${descr}"
  print_tag "description" "${descr}"
  print_tag "pubDate" "${date}"
  print_tag "link" "${url}"
  printf '%s</item>\n' "${indentstr}"
done

cat << EOF
    </channel>
</rss>
EOF
