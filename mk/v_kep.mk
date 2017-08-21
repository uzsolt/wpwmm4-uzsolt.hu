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

.for P in ${TMP}
THUMBFILE:=${P:C,^,${STATICDIR}pict/${DIR}/thumb/,}
${VIRTUALDIR_keplist}${K}_REQ:=${THUMBFILE}

${THUMBFILE}: ${STATICDIR}pict/${DIR}/${P}
	@convert -resize 64x64^ -gravity center -extent 64x64 -strip ${.ALLSRC} ${.TARGET}

.endfor
.endfor

