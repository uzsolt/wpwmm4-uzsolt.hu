VIRTUALTEMPLATE_keplist=keplist
VIRTUALDIR_keplist=pict/
VIRTUALOUT_keplist=	grafika/index.html \
			joke/geek/index.html \
			joke/mathphys/index.html \
			personal/other/index.html \
			personal/summer2010/index.html \
			personal/summer2011/index.html \
			personal/summer2012/index.html \
			personal/summer2014/index.html
VIRTUALREQ_keplist= scripts/list_thumbs.sh
VIRTUALREQRULE_keplist=C,(.*)/index.html,data/${VIRTUALDIR_keplist}\1.psv,
