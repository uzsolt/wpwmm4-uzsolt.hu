VIRTUALTEMPLATE_select_evf=select_evf
VIRTUALOUT_select_evf=${COMP_LISTS:=/evf.html}
VIRTUALREQ_select_evf+=scripts/list_evf.sh
VIRTUALREQRULE_select_evf=C,(.*)/evf.html,data/\1.psv,
