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
TARGETS=notes/bsd/copy_cddvd.html \
		notes/bsd/daemon.html \
		notes/joke/curry.html \
		notes/joke/kenyer.html

# Global requirement
GREQ=${MENUTARGET}

# Category of virtually created files.
# Name of values will use the ${value}.m4 inside ${VIRT_DIR}.
VIRTUALS=kep \
		 menu \
		 edumath eduphys \
		 notes_list \
		 select_tanev_evf \
		 select_tanev select_evf\
		 list_evf_pdf list_tanev_pdf \
		 pdf

# The templates for virtuals.
VIRTUALTEMPLATE_kep=kep
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
VIRTUALDIR_kep=pict/
VIRTUALDIR_menu=
VIRTUALDIR_edumath=edu/math/
VIRTUALDIR_eduphys=edu/phys/
VIRTUALDIR_notes_list=
VIRTUALDIR_pdf=
VIRTUALDIR_list_evf_pdf=
VIRTUALDIR_list_tanev_pdf=

# Which files should be created inside ${VIRTUALDIR_${v}}
VIRTUALOUT_kep=kep1.html \
			kep2.html \
			kep3.html

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

VIRTUALOUT_pdf=	edu/math/exams07/index.html \
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
VIRTUALREQ_pdf=scripts/pdfitems.sh
VIRTUALREQRULE_pdf=C,(.*)/index.html,data/\1.psv,

VIRTUALOUT_select_tanev_evf=${COMP_LISTS:=/index.html}
VIRTUALREQ_select_tanev_evf=comp_lists.mk

VIRTUALOUT_select_tanev=${COMP_LISTS:=/tanev.html}
VIRTUALREQ_select_tanev=scripts/list_tanev.sh

VIRTUALOUT_select_evf=${COMP_LISTS:=/evf.html}
VIRTUALREQ_select_evf=scripts/list_evf.sh

VIRTUALREQ_list_evf_pdf=scripts/list_comp_pdf.sh
VIRTUALREQ_list_tanev_pdf=${VIRTUALREQ_list_evf_pdf}

MENUDATAFILE=data/menu.psv
include comp_lists.mk
include generate_menu.mk

pre-everything:

clean-other:
	rm -rf menu
