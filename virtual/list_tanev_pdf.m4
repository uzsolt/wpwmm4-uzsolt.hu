m4_divert(-1)
_INCL(common.m4)
_2_BODY(_include_menu)
_2_HEAD(m4_include(01_header.m4))
_2_BODY(<div id="content">
  _SCRIPT(list_comp_pdf.sh _DIRECTORY 1 _FILE)
</div>)
_PR_ALL

