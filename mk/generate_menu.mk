MENUDIR=menu
MENUFILE=menu.gen
MENUTARGET!=sed -n '/^\// s,^\([^|]*\).*,${MENUDIR}\1${MENUFILE},p' ${MENUDATAFILE} data/comp_lists.psv
MENUTARGET:=${MENUDIR}/${MENUFILE} ${MENUTARGET}

.for T in ${TARGETS}
${T}_REQ+=${MENUDIR}/${T:H}/${MENUFILE}
${T}_REQ:=${${T}_REQ}
.endfor

.for V in ${VIRTUALS}
.for VO in ${VIRTUALOUT_${V}}
VOUT:=${VIRTUALDIR_${V}}${VO}
D=${VOUT:H}/
.if ${D} == ./
D:=
.endif
${VOUT}_REQ+=${MENUDIR}/${D}${MENUFILE}
${VOUT}_REQ:=${${VOUT}_REQ}
.endfor
MENUTARGET+=${MENUDIR}/${D}${MENUFILE}
MENUTARGET:=${MENUTARGET}
.endfor
MENUTARGET:=${MENUTARGET:u}

${MENUTARGET}: data/menu.psv scripts/genmenu.sh
	@${MSG1} Creating menu ${.TARGET}
	@mkdir -p ${.TARGET:S/${MENUFILE}$//}
	@scripts/genmenu.sh ${.TARGET:S/^${MENUDIR}//:S/${MENUFILE}$//} > ${.TARGET}

