MENUDIR=menu/
MENUFILE=menu.gen
.for V in ${VIRTUALS}
TMENUTARGET:=${VIRTUALDIR_${V}}
TMENUTARGET:=${TMENUTARGET:M*}
TMENUTARGET:=${TMENUTARGET} ${VIRTUALOUT_${V}:S/^/${VIRTUALDIR_${V}}/:H:=/}
MENUTARGET:=${MENUTARGET} ${TMENUTARGET}
.endfor
MENUTARGET:=${MENUTARGET:S/.//g:O:u:C/^ *\///g}
MENUTARGETX:=${MENUTARGET}
.for X in 1 2 3 4 5 6
MENUTARGETX:=${MENUTARGETX:S/\/$//g:H:H:S/.//g}
MENUTARGET:=${MENUTARGET} ${MENUTARGETX}
.endfor
MENUTARGET:=${MENUTARGET:S/.//g:C/^ *\///g:S/\/$//g:O:u}
MENUTARGET:=${MENUTARGET:S/^/${MENUDIR}/:S/$/\/${MENUFILE}/}

generate-menu: ${MENUTARGET}

${MENUTARGET}: data/menu.json scripts/genmenu.pl
	@mkdir -p ${.TARGET:S/${MENUFILE}$//}
	@scripts/genmenu.pl /${.TARGET:S/^${MENUDIR}//:S/${MENUFILE}$//} > ${.TARGET}

