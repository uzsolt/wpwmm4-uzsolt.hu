TARGETS+=	\
	notes/latex/angles.html \
	notes/latex/grid.html \
	notes/latex/randomize_exsheets.html \
	notes/latex/segments.html \
	notes/latex/smiley.html \

notes/latex/angles.html_REQ=	\
	${DEST_DIR}notes/latex/angles.png
notes/latex/grid.html_REQ=	\
	${DEST_DIR}notes/latex/grid.png
notes/latex/segments.html_REQ=	\
	${DEST_DIR}notes/latex/segments.png

.include "mk/latex_png.mk"
