TEMPDIR=./temp/
PDFLATEX=pdflatex -output-directory=${TEMPDIR} ${.ALLSRC} > /dev/null
CONVERT=convert ${.TARGET:C,.*/,${TEMPDIR},:R}.pdf ${.TARGET}

${DEST_DIR}notes/latex/angles.png: ${SRC_DIR}notes/latex/angles.tex
	@${PDFLATEX}
	@${CONVERT}

${DEST_DIR}notes/latex/grid.png: ${SRC_DIR}notes/latex/grid.tex
	@${PDFLATEX}
	@${CONVERT}

${DEST_DIR}notes/latex/segments.png: ${SRC_DIR}notes/latex/segments.tex
	@${PDFLATEX}
	@${CONVERT}
