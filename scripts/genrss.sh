#!/bin/sh

. scripts/functions
cat << EOF
<?xml version="1.0" encoding="UTF-8"?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
    <channel>
        <title>Udvari Zsolt honlapja - frissítések</title>
EOF

indentstr='          '
indentstr2="${indentstr}  "

print_tag() {
  printf '%s<%s>%s</%s>\n' "${indentstr2}" "${1}" "${2}" "${1}"
}

process() {
  printf '%s<item>\n' "${indentstr}"
  print_tag "title" "${descr}"
  print_tag "description" "${descr}"
  print_tag "pubDate" "${date}"
  print_tag "link" "${url}"
  printf '%s</item>\n' "${indentstr}"
}

tail -n 20 data/news.psv | read_data_stdin process date descr url

cat << EOF
    </channel>
</rss>
EOF
