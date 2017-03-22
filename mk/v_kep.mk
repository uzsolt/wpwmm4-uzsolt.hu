VIRTUALTEMPLATE_kep=kep
VIRTUALDIR_kep=

VIRTUALREQ_kep=scripts/kep.sh
.for K in ${VIRTUALOUT_keplist}
DIR:=${K:C,/index.html,,}
TMP!=awk -F '|' '{print $$1}' data/pict/${DIR}.psv
VIRTUALOUT_kep+=${TMP:C,$,.html,:C,^,pict/${DIR}/,}
# Force expand the VIRTUALOUT_kep variable!
VIRTUALOUT_kep:=${VIRTUALOUT_kep}
.endfor

