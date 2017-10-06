#!/bin/sh

. scripts/functions

DIR=${1}
NR=0
process() {
  printf '  <div class="thumb">\n'
  printf '    <a href="%s"><img class="thumbsprite-%s" width=64 height=64 src="%s" alt="%s"/></a>\n' \
    "${pict}.html" \
    "${NR}" \
    "/static/${DIR}/thumbsprite.jpg" \
    "${descr}"
  printf '    <div class="thumb_desc">%s</div>\n' "${descr}"
  printf '  </div>\n'
  NR=$((NR+1))
}

read_data data/${DIR}.psv process pict descr
