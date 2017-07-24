VIRTUALTEMPLATE_list_art_pdf=list_art_pdf
VIRTUALDIR_list_art_pdf=edu/phys/art/
VIRTUALOUT_list_art_pdf= atom/index.html \
												 csillag/index.html \
												 elektr/index.html \
												 em/index.html \
												 feny/index.html \
												 fiztori/index.html
VIRTUALREQ_list_art_pdf=scripts/list_art_pdf.sh
VIRTUALREQRULE_list_art_pdf=C,(.*)/index.html,data/edu/phys/art/\1.psv,
