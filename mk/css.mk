TARGETS_MANUAL+=css/main.css
${DEST_DIR}css/main.css: \
	assets/css/main.css \
	assets/css/_image.scss \
	assets/css/_menu.scss \
	assets/css/_responsive.scss \
	assets/css/_stuff.scss \
	assets/css/_syntax.scss \
	assets/css/_table.scss
	@mkdir -p ${DEST_DIR}css
	sassc -t compressed assets/css/main.css ${.TARGET}
