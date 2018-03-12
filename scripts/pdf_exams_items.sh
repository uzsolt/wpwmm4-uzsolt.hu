#!/bin/sh

. scripts/functions

case `echo ${1} | awk -F / '{print $3}'` in
  math)
    title="Matematika"
    ;;
  phys)
    title="Fizika"
    ;;
esac

case `echo ${1} | awk -F / '{print $4}'` in
  exams)
    titlecat="feladatsorok"
    ;;
  guide)
    titlecat="segédletek"
    ;;
esac

title="${title} ${titlecat}"

printf '<h1>%s</h1>\n' "${title}"
printf '<h2>'
if echo "${2}" | grep -qx '[0-9]\+'; then
  printf '%s. évfolyam' ${2}
else
  printf 'Érettségi gyakorló feladatsorok'
fi
printf '</h2>\n'
DIR=`echo ${1}/${2} | sed "s,/[^/]*,/static/stuff,"`
process() {
  echo "_own_pdf(\`${txt}',\`${DIR}/${path}',\`${tooltip}')"
}

read_data data/${1}/${2}.psv process txt path tooltip
