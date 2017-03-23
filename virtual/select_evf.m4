m4_divert(-1)
_INCL(common.m4)
_2_BODY(_include_menu)
_2_HEAD(m4_include(01_header.m4))
_2_BODY(<div id="content">
  <h1>_ACTIVETOOLTIP</h1>
  _SCRIPT(list_evf.sh _DIRECTORY)
</div>)
_PR_ALL
