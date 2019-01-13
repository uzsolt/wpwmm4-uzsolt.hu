TARGETS+=	\
	notes/svn/git2svn.html \
	notes/svn/svnlog.html \
	notes/svn/svn-mirror-github.html \
	notes/svn/svnsync.html \
	notes/svn/svn-taskwarrior.html \
	notes/svn/config_under_svn.html \
	notes/svn/automatic-ignore.html \

notes/svn/git2svn.html_REQ=	\
	src/notes/svn/git2svn.sh \
	src/notes/svn/git2svn_time.sh
notes/svn/svn-mirror-github.html_REQ=	\
	src/notes/svn/svn-mirror-github.sh \
	src/notes/svn/svn-mirror-github-post-commit.sh
notes/svn/svnsync.html_REQ=	\
	src/notes/svn/svnsync_init.sh
notes/svn/svn-taskwarrior.html_REQ= \
	src/notes/svn/svn-taskwarrior-add.sh \
	src/notes/svn/svn-taskwarrior-exit.sh \
	src/notes/svn/svn-taskwarrior-modify.sh
