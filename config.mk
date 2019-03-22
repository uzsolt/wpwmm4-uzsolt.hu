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
.include "mk/about.mk"
.include "mk/edu_phys.mk"
.include "mk/notes_bsd.mk"
.include "mk/notes_cli.mk"
.include "mk/notes_eco.mk"
.include "mk/notes_joke.mk"
.include "mk/notes_latex.mk"
.include "mk/notes_other.mk"
.include "mk/notes_r.mk"
.include "mk/notes_svn.mk"
.include "mk/notes_web.mk"
.include "mk/root.mk"

.for T in ${TARGETS}
.if ${T:C,/.*,,}==notes
${T}_REQ+=${LAYOUT_DIR}note.m4
.endif
.endfor

.include "mk/css.mk"

MKDIR_REQ=data/menu.psv mk/comp_lists.mk

# Global requirement
GREQ=${MENUTARGET} include/01_header.m4

# Category of virtually created files.
.include "mk/virtuals.mk"

MENUDATAFILE=data/menu.psv
STATICDIR=/usr/local/www/static/

include mk/comp_lists.mk
include mk/generate_menu.mk

pre-everything:

clean-other:
	rm -rf menu
