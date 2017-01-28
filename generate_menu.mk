MENUDIR=menu
MENUFILE=menu.gen
MENUTARGET!=sed -n '/^\// s,^\([^|]*\).*,${MENUDIR}\1${MENUFILE},p' ${MENUDATAFILE}
MENUTARGET:=${MENUDIR}/${MENUFILE} ${MENUTARGET}

${MENUTARGET}: data/menu.psv scripts/genmenu.sh
	@mkdir -p ${.TARGET:S/${MENUFILE}$//}
	@scripts/genmenu.sh ${.TARGET:S/^${MENUDIR}//:S/${MENUFILE}$//} > ${.TARGET}

