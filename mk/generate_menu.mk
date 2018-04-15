MENUDIR=menu
MENUFILE=menu.gen
MENUEXTRAFILES=data/comp_lists.psv data/art_lists.psv data/video_lists.psv
MENUTARGET!=sed -n '/^\// s,^\([^|]*\).*,${MENUDIR}\1${MENUFILE},p' \
	${MENUDATAFILE} ${MENUEXTRAFILES}
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
MENUTARGET+=${MENUDIR}/${D}${MENUFILE}
MENUTARGET:=${MENUTARGET}
.endfor
.endfor
MENUTARGET:=${MENUTARGET:u}

${MENUTARGET}: ${MENUDATAFILE} scripts/genmenu.sh ${MENUEXTRAFILES}
	@${MSG1} Creating menu ${.TARGET}
	@mkdir -p ${.TARGET:S/${MENUFILE}$//}
	@scripts/genmenu.sh ${.TARGET:S/^${MENUDIR}//:S/${MENUFILE}$//} > ${.TARGET}
