#!/bin/sh

. scripts/functions

DIR=${1}
process() {
  printf '  <div class="thumb">\n'
  printf '    <a href="%s"><img width=64 height=64 src="%s" alt="%s"/></a>\n' "${pict}.html" "/static/${DIR}/thumb/${pict}" "${descr}"
  printf '    <div class="thumb_desc">%s</div>\n' "${descr}"
  printf '  </div>\n'
}

read_data data/${DIR}.psv process pict descr
