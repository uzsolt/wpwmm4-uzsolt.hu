#!/bin/sh

read new_task

cd ~/.task
if [ -s commit_msg ]; then
  svn commit -q -F commit_msg *.data
  svn up -q
fi
: > commit_msg

exit 0
