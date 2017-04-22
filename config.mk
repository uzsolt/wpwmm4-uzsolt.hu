# Where the sources (m4) are.
SRC_DIR=src/

# Where the assets are.
ASSETS_DIR=assets/

# Destination directory
DEST_DIR=/home/zsolt/public_html/uzsolt/

# Where the layouts are.
LAYOUT_DIR=layout/

# Virtual directory
VIRT_DIR=virtual/

# Targets in ${DEST_DIR}
TARGETS=index.html \
		about/index.html \
		notes/bsd/copy_cddvd.html \
		notes/bsd/daemon.html \
		notes/bsd/dump_volume.html \
		notes/cli/feh_wallpaper.html \
		notes/cli/ffmpeg_dvd_player.html \
		notes/cli/html_parse.html \
		notes/cli/pdf_jelszo.html \
		notes/cli/pdfjam.html \
		notes/cli/rsync_transmission.html \
		notes/joke/curry.html \
		notes/joke/kenyer.html \
		notes/latex/angles.html \
		notes/latex/grid.html \
		notes/latex/randomize_exsheets.html \
		notes/latex/segments.html \
		notes/latex/smiley.html \
		notes/phys/atom.html \
		notes/phys/h2o.html \
		notes/web/gyors-oldal.html
index.html_REQ=scripts/genmain.sh data/news.psv
.for T in ${TARGETS}
.if ${T:C,/.*,,}==notes
${T}_REQ+=${LAYOUT_DIR}note.m4
.endif
.endfor

TARGETS_MANUAL=feed.xml
${DEST_DIR}feed.xml: data/news.psv scripts/genrss.sh
	${MSG1} Generating feed.xml...
	@scripts/genrss.sh > ${.TARGET}

MKDIR_REQ=data/menu.psv mk/comp_lists.mk

notes/latex/angles.html_REQ=${DEST_DIR}notes/latex/angles.png
notes/latex/grid.html_REQ=${DEST_DIR}notes/latex/grid.png
notes/latex/segments.html_REQ=${DEST_DIR}notes/latex/segments.png
.include "mk/latex_png.mk"

# Global requirement
GREQ=${MENUTARGET} include/01_header.m4

# Category of virtually created files.
# Name of values will use the ${value}.m4 inside ${VIRT_DIR}.
VIRTUALS=kep \
		 keplist \
		 menu \
		 edumath eduphys \
		 notes_list \
		 select_tanev_evf \
		 select_tanev select_evf\
		 list_evf_pdf list_tanev_pdf \
		 pdf

MENUDATAFILE=data/menu.psv
STATICDIR=/home/zsolt/public_html/uzsolt-static/static/

include mk/v_menu.mk
include mk/v_edumath.mk
include mk/v_eduphys.mk
include mk/v_keplist.mk
include mk/v_kep.mk
include mk/v_notes_list.mk
include mk/v_select_tanev_evf.mk
include mk/v_select_tanev.mk
include mk/v_select_evf.mk
include mk/v_list_evf_pdf.mk
include mk/v_list_tanev_pdf.mk
include mk/v_pdf.mk
include mk/comp_lists.mk
include mk/generate_menu.mk

pre-everything:

clean-other:
	rm -rf menu
