VIRTUALTEMPLATE_exams_pdf=pdf_exams_items
VIRTUALDIR_exams_pdf=
VIRTUALOUT_exams_pdf= \
	edu/math/exams/06.html \
	edu/math/exams/07.html \
	edu/math/exams/08.html \
	edu/math/exams/09.html \
	edu/math/exams/10.html \
	edu/math/exams/11.html \
	edu/math/exams/12.html \
	edu/math/exams/erettsegi.html \
	edu/math/guide/09.html \
	edu/math/guide/10.html \
	edu/math/guide/11.html \
	edu/math/guide/12.html \
	edu/phys/exams/07.html \
	edu/phys/exams/08.html \
	edu/phys/exams/09.html \
	edu/phys/exams/10.html \
	edu/phys/exams/11.html \
	edu/phys/guide/07.html \
	edu/phys/guide/08.html \
	edu/phys/guide/09.html \
	edu/phys/guide/10.html \
	edu/phys/guide/11.html
VIRTUALREQ_exams_pdf+=scripts/pdf_exams_items.sh
VIRTUALREQRULE_exams_pdf=C,(.*)/([^/]*).html,data/\1/\2.psv,
