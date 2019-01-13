# Where the sources (m4) are.
SRC_DIR=src/

# Destination directory
DEST_DIR=/usr/local/www/uzsolt/
COMMON_DIR=/home/zsolt/svn/wpwmm4/
.ifdef WIP
include wip.mk
.endif
# Where the layouts are.
LAYOUT_DIR=layout/

# Virtual directory
VIRT_DIR=virtual/

HOOK_POST_HTML=${MSG2} Checking validity ; tidy5 -q -e -f /dev/stdout ${.TARGET} | sed '/About/,$$d ; s,^,     ,'
HOOK_POST_VHTML=${HOOK_POST_HTML}

# Targets in ${DEST_DIR}
TARGETS=	\
	about/index.html \
	notes/eco/bevallas.html \
	notes/web/gyors-oldal.html
.include "mk/edu_phys.mk"
.include "mk/notes_bsd.mk"
.include "mk/notes_cli.mk"
.include "mk/notes_joke.mk"
.include "mk/notes_latex.mk"
.include "mk/notes_other.mk"
.include "mk/notes_svn.mk"
.include "mk/root.mk"

.for T in ${TARGETS}
.if ${T:C,/.*,,}==notes
${T}_REQ+=${LAYOUT_DIR}note.m4
.endif
.endfor

TARGETS_MANUAL=feed.xml
${DEST_DIR}feed.xml: data/news.psv scripts/genrss.sh
	${MSG1} Generating feed.xml...
	@scripts/genrss.sh > ${.TARGET}

TARGETS_MANUAL+=css/main.css
${DEST_DIR}css/main.css: \
	assets/css/main.css \
	assets/css/_image.scss \
	assets/css/_menu.scss \
	assets/css/_stuff.scss \
	assets/css/_syntax.scss \
	assets/css/_table.scss
	@mkdir -p ${DEST_DIR}css
	sassc -t compressed assets/css/main.css ${.TARGET}

MKDIR_REQ=data/menu.psv mk/comp_lists.mk

# Global requirement
GREQ=${MENUTARGET} include/01_header.m4

# Category of virtually created files.
# Name of values will use the ${value}.m4 inside ${VIRT_DIR}.
.include "mk/virtuals.mk"

MENUDATAFILE=data/menu.psv
STATICDIR=/usr/local/www/static/

include mk/comp_lists.mk
include mk/generate_menu.mk

pre-everything:

clean-other:
	rm -rf menu
