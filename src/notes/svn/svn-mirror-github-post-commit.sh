#!/bin/sh

# svn.yourdomain.com/repos/project_name/hooks/post-commit

cd /path/to/git/project_name
git svn rebase
git push origin master
