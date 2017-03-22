TEMPDIR=./temp/
PDFLATEX=pdflatex -output-directory=${TEMPDIR} ${.ALLSRC} > /dev/null
CONVERT=convert ${.TARGET:C,.*/,${TEMPDIR},:R}.pdf ${.TARGET}

.for PNG in angles grid segments
${DEST_DIR}notes/latex/${PNG}.png: ${SRC_DIR}notes/latex/${PNG}.tex
	@${PDFLATEX}
	@${CONVERT}
.endfor
