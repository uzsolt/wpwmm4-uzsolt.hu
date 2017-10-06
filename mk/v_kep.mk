VIRTUALTEMPLATE_kep=kep
VIRTUALDIR_kep=
VIRTUALREQ_kep=scripts/kep.sh
VIRTUALREQRULE_kep=C,(.*)/.*.html,data/\1.psv,

.for K in ${VIRTUALOUT_keplist}
DIR:=${K:C,/index.html,,}
TMP!=awk -F '|' '{print $$1}' data/pict/${DIR}.psv
KEP:=${TMP:C,^,pict/${DIR}/,}
KEPHTML:=${KEP:C,$,.html,}

VIRTUALOUT_kep+=${KEPHTML}
VIRTUALOUT_kep:=${VIRTUALOUT_kep}

THUMBFILE:=${STATICDIR}pict/${DIR}/thumbsprite.jpg
${VIRTUALDIR_keplist}${K}_REQ+=${THUMBFILE}
${VIRTUALDIR_keplist}${K}_REQ:=${${VIRTUALDIR_keplist}${K}_REQ}

${THUMBFILE}: ${KEP:C,^,${STATICDIR},}
	@${MSG1} Create ${.TARGET}
	@convert ${.ALLSRC} -resize 64x64^ -gravity center -extent 64x64 -strip -append ${.TARGET}

.endfor

