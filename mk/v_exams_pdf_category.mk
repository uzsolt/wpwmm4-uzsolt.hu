VIRTUALTEMPLATE_exams_pdf_category=	pdf_exams_items_category
VIRTUALDIR_exams_pdf_category=
VIRTUALOUT_exams_pdf_category=	\
	edu/math/exams/09.html
VIRTUALREQ_exams_pdf_category+=	\
	scripts/pdf_exams_items_category.sh \
	scripts/functions-pdf_exams_items
VIRTUALREQRULE_exams_pdf_category=C,(.*)/([^/]*).html,data/\1/\2.psv,
