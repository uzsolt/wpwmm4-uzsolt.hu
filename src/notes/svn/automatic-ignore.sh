#!/bin/sh

set -e
trap "clean" INT TERM EXIT

REPOS="${1}"

for prg in svn svnlook svnmucc; do
  if which -s ${prg}; then
    eval ${prg}=${prg}
  else
    eval ${prg}=/usr/bin/svnlite${prg#svn}
  fi
done

FILES_TO_CLEAN=""

clean() {
  [ -n "${FILES_TO_CLEAN}" ] && rm -r ${FILES_TO_CLEAN}
}

SEXT=tex
DEXT=pdf
TMPFILE=$(mktemp -t svndocs)
FILELIST=$(mktemp -t svndocs)
PROPS=$(mktemp -t svndocs)
NEWFILES=$(mktemp -t svndocs)
FILES_TO_CLEAN="${FILES_TO_CLEAN} ${TMPFILE} ${FILELIST} ${PROPS} ${NEWFILES}"

LASTREV=$(${svnlook} youngest ${REPOS})
! ${svnlook} changed ${REPOS} | sed -n "/\.${SEXT}$/ s,^. *,,p" | sort -u > ${TMPFILE}

for dir in $(sed "s,\(.*\)/.*\.${SEXT}$,\1,p" ${TMPFILE} | sort -u); do

	sed -n "\@^${dir}@ s,${dir}/\(.*\)\.${SEXT},\1.${DEXT},p" ${TMPFILE} > ${FILELIST}
	! ${svn} propget svn:ignore file://${REPOS}/${dir} | grep -v '^$' | sort -u > ${PROPS}
	comm -23 ${FILELIST} ${PROPS} > ${NEWFILES}

	if [ $(stat -f %z ${NEWFILES}) -gt 1 ]; then
		cat ${NEWFILES} ${PROPS} | sort -u > ${FILELIST}
		${svnmucc} -U file://${REPOS} -m "kihagyás: r${LASTREV}" propsetf svn:ignore ${FILELIST} ${dir}
	fi

done
