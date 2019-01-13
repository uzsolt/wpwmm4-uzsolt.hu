TARGETS+=	\
	index.html \
	news.html

index.html_REQ=scripts/genmain.sh data/news.psv ${LAYOUT_DIR}main.m4
news.html_REQ=${index.html_REQ}

TARGETS_MANUAL+=feed.xml
${DEST_DIR}feed.xml: data/news.psv scripts/genrss.sh
	${MSG1} Generating feed.xml...
	@scripts/genrss.sh > ${.TARGET}
