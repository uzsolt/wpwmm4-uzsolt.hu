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
printf '<h2>%s. évfolyam</h2>\n' ${2}
DIR=`echo ${1}/${2} | sed "s,/[^/]*,/static/stuff,"`
process() {
  echo "_own_pdf(\`${txt}',\`${DIR}/${path}',\`${tooltip}')"
}

read_data data/${1}/${2}.psv process txt path tooltip
