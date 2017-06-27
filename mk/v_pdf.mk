VIRTUALTEMPLATE_pdf=pdfitems
VIRTUALDIR_pdf=
VIRTUALOUT_pdf=	downloads/dox/index.html \
				downloads/linuxvilag/index.html \
				edu/math/guide/index.html	\
				edu/phys/guide/index.html \
				edu/eco/index.html
VIRTUALREQ_pdf+=scripts/pdfitems.sh
VIRTUALREQRULE_pdf=C,(.*)/index.html,data/\1.psv,
