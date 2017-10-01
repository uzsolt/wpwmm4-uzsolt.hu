TMPDIR=$(mktmp -d)

mkdir -p ${TMPDIR}
git clone ${GITREPO} ${TMPDIR}/git
svn checkout ${SVNDIR} ${TMPDIR}/svn

cd ${TMPDIR}/git
# az r1 a git importálás, ezért kezdünk 2-nél
rev=2
git log --reverse --date=iso-strict | sed -n '/Date:/ s,Date: *\(.*\)+..:..,\1.000000Z,p' | while read line; do
  svn propset -r${rev} --revprop svn:date "${line}" ${TMPDIR}/svn
  rev=$((rev+1))
done

rm -rf ${TMPDIR}
