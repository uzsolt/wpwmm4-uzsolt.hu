svnadmin create $SVNDIR
svn mkdir file://$SVNDIR/{trunk,branches,tags} -m 'git import'
git svn clone file://$SVNDIR --stdlayout
cd $NEWDIR
git remote add origin $GITREPO
git fetch origin
git checkout -b old_master origin/master
git rebase --onto master --root
git svn dcommit

# ha valami nem létezik
git filter-branch --index-filter 'git rm  --cached --ignore-unmatch path/to/the/formerly/misbehaving/module'
git svn dcommit
