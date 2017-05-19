VIRTUALTEMPLATE_select_tanev=select_tanev
VIRTUALOUT_select_tanev=${COMP_LISTS:=/tanev.html}
VIRTUALREQ_select_tanev+=scripts/list_tanev.sh
VIRTUALREQRULE_select_tanev=C,(.*)/tanev.html,data/\1.psv,
