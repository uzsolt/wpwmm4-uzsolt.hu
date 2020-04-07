#!/bin/sh

a_img() {
  printf '    <a href="%s"><img src="%s" alt="%s"/></a>\n' "$1" "$2" "$3"
}

IFS='|'

prev_fn=""
prev_descr=""
curr_fn=""
curr_descr=""
next_fn=""
next_descr=""

grep -C 1 "$2|" data/${1}.psv | ( while read fn descr; do
  if [ "${fn}" == "$2" ]; then
    curr_fn="${fn}"
    curr_descr="${descr}"
  elif [ -z "${curr_fn}" ]; then
    prev_fn="${fn}"
    prev_descr="${descr}"
  else
    next_fn="${fn}"
    next_descr="${descr}"
  fi
done

printf '  <div class="imgview">\n'
printf '    <div class="imgdesc">%s</div>\n' "${curr_descr}"
printf '    <a href="%s"><img src="%s" alt="%s" class="imgviewed"/></a>\n' "/static/$1/${curr_fn}" "/static/$1/${curr_fn}" "${curr_descr}"

printf '  <div class="imgnav">\n'
  [ -n "${prev_fn}" ] && a_img "${prev_fn}.html" "/icons/go-previous.png" "Előző"
  a_img "/${1}/" "/icons/go-home.png" "Vissza"
  [ -n "${next_fn}" ] && a_img "${next_fn}.html" "/icons/go-next.png" "Következő"
printf '  </div>\n'
printf '  </div>\n'

)
