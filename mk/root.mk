TARGETS+=	\
	index.html \
	news.html

index.html_REQ=scripts/genmain.sh data/news.psv ${LAYOUT_DIR}main.m4
news.html_REQ=${index.html_REQ}
