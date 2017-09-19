cd mirror.server/svn-repos/
svnadmin create myrepo
echo "#!/bin/sh" > myrepo/hooks/pre-revprop-change
chmod +x myrepo/hooks/pre-revprop-change

