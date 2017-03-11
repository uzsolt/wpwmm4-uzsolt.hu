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
TARGETS=about/index.html \
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

TARGETS_MANUAL=feed.xml
${DEST_DIR}feed.xml: data/news.psv scripts/genrss.sh
	scripts/genrss.sh > ${.TARGET}

MKDIR_REQ=data/menu.psv comp_lists.mk

notes/latex/angles.html_REQ=${DEST_DIR}notes/latex/angles.png
notes/latex/grid.html_REQ=${DEST_DIR}notes/latex/grid.png
notes/latex/segments.html_REQ=${DEST_DIR}notes/latex/segments.png
.include "latex_png.mk"

# Global requirement
GREQ=${MENUTARGET}

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

# The templates for virtuals.
VIRTUALTEMPLATE_kep=kep
VIRTUALTEMPLATE_keplist=keplist
VIRTUALTEMPLATE_menu=emptymenu
VIRTUALTEMPLATE_edumath=emptymenu
VIRTUALTEMPLATE_eduphys=emptymenu
VIRTUALTEMPLATE_notes_list=notes_list
VIRTUALTEMPLATE_select_tanev_evf=select_tanev_evf
VIRTUALTEMPLATE_select_tanev=select_tanev
VIRTUALTEMPLATE_select_evf=select_evf
VIRTUALTEMPLATE_pdf=pdfitems
VIRTUALTEMPLATE_list_evf_pdf=list_evf_pdf
VIRTUALTEMPLATE_list_tanev_pdf=list_tanev_pdf

# Properties of VIRTUALS
# Destination directory inside ${DEST_DIR}
VIRTUALDIR_kep=
VIRTUALDIR_keplist=pict/
VIRTUALDIR_menu=
VIRTUALDIR_edumath=edu/math/
VIRTUALDIR_eduphys=edu/phys/
VIRTUALDIR_notes_list=
VIRTUALDIR_pdf=
VIRTUALDIR_list_evf_pdf=
VIRTUALDIR_list_tanev_pdf=

# Which files should be created inside ${VIRTUALDIR_${v}}
VIRTUALOUT_keplist= grafika/index.html \
					joke/geek/index.html \
					joke/mathphys/index.html \
					personal/other/index.html \
					personal/summer2010/index.html \
					personal/summer2011/index.html \
					personal/summer2012/index.html \
					personal/summer2014/index.html
VIRTUALREQ_keplist= scripts/list_thumbs.sh
VIRTUALREQRULE_keplist=C,(.*)/index.html,data/${VIRTUALDIR_keplist}\1.psv,

VIRTUALREQ_kep=scripts/kep.sh
.for K in ${VIRTUALOUT_keplist}
DIR:=${K:C,/index.html,,}
TMP!=awk -F '|' '{print $$1}' data/pict/${DIR}.psv
VIRTUALOUT_kep+=${TMP:C,$,.html,:C,^,pict/${DIR}/,}
# Force expand the VIRTUALOUT_kep variable!
VIRTUALOUT_kep:=${VIRTUALOUT_kep}
.endfor

VIRTUALOUT_menu= index.html \
				 edu/index.html \
				 comp/index.html \
				 comp/math/index.html \
				 comp/phys/index.html \
				 pict/index.html \
				 pict/personal/index.html \
				 pict/joke/index.html \
				 downloads/index.html \
				 notes/index.html \

VIRTUALOUT_edumath=	index.html
VIRTUALOUT_eduphys=	index.html

VIRTUALOUT_notes_list= notes/bsd/index.html \
					   notes/cli/index.html \
					   notes/joke/index.html \
					   notes/latex/index.html \
					   notes/phys/index.html \
					   notes/web/index.html
VIRTUALREQ_notes_list=scripts/list_notes.sh
VIRTUALREQRULE_notes_list=C,(.*)/index.html,data/\1.psv,

VIRTUALOUT_pdf=	downloads/dox/index.html \
				downloads/linuxvilag/index.html \
				edu/math/exams07/index.html \
				edu/math/exams08/index.html \
				edu/math/exams09/index.html \
				edu/math/exams10/index.html \
				edu/math/exams11/index.html \
				edu/math/exams12/index.html \
				edu/math/guide/index.html	\
				edu/phys/exams07/index.html \
				edu/phys/exams08/index.html \
				edu/phys/exams10/index.html \
				edu/phys/exams11/index.html \
				edu/phys/guide/index.html \
				edu/eco/index.html
VIRTUALREQ_pdf+=scripts/pdfitems.sh
VIRTUALREQRULE_pdf=C,(.*)/index.html,data/\1.psv,

VIRTUALOUT_select_tanev_evf=${COMP_LISTS:=/index.html}
VIRTUALREQ_select_tanev_evf+=comp_lists.mk

VIRTUALOUT_select_tanev=${COMP_LISTS:=/tanev.html}
VIRTUALREQ_select_tanev+=scripts/list_tanev.sh

VIRTUALOUT_select_evf=${COMP_LISTS:=/evf.html}
VIRTUALREQ_select_evf+=scripts/list_evf.sh

VIRTUALREQ_list_evf_pdf=scripts/list_comp_pdf.sh
VIRTUALREQ_list_tanev_pdf+=${VIRTUALREQ_list_evf_pdf}

MENUDATAFILE=data/menu.psv
include comp_lists.mk
include generate_menu.mk

pre-everything:

clean-other:
	rm -rf menu
