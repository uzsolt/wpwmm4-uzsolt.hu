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
TARGETS=#teszt.html \
		#proba.html

# Category of virtually created files.
# Name of values will use the ${value}.m4 inside ${VIRT_DIR}.
VIRTUALS=kep \
		 menu \
		 edumath eduphys \
		 select_tanev_evf \
		 pdf

# The templates for virtuals.
VIRTUALTEMPLATE_kep=kep
VIRTUALTEMPLATE_menu=emptymenu
VIRTUALTEMPLATE_edumath=emptymenu
VIRTUALTEMPLATE_eduphys=emptymenu
VIRTUALTEMPLATE_select_tanev_evf=select_tanev_evf
VIRTUALTEMPLATE_pdf=pdfitems

# Properties of VIRTUALS
# Destination directory inside ${DEST_DIR}
VIRTUALDIR_kep=pict/
VIRTUALDIR_menu=
VIRTUALDIR_edumath=edu/math/
VIRTUALDIR_eduphys=edu/phys/
VIRTUALDIR_pdf=

# Which files should be created inside ${VIRTUALDIR_${v}}
VIRTUALOUT_kep=kep1.html \
			kep2.html \
			kep3.html

VIRTUALOUT_menu= index.html \
				 edu/index.html \
				 comp/index.html \
				 comp/math/index.html \
				 comp/phys/index.html

VIRTUALOUT_edumath=	index.html
VIRTUALOUT_eduphys=	index.html

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

include comp_lists.mk
VIRTUALOUT_select_tanev_evf=${COMP_LISTS:=/index.html}
