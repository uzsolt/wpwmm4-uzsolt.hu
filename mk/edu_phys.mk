TARGETS+=	\
	edu/phys/art/index.html \
	edu/phys/video/index.html \

edu/phys/art/index.html_REQ=scripts/select_art.sh data/art_lists.psv
edu/phys/video/index.html_REQ+=scripts/select_video.sh
