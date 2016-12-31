m4_divert(-1)
_INCL(common.m4)
_2_HEAD(m4_include(01_header.m4))
_2_BODY(_SCRIPT(genmenu.pl /_DIRECTORY))
_2_BODY(<div id="content">
_csoportositas(evf.html,Évfolyamonként csoportosítva)
_csoportositas(tanev.html,Tanévenként csoportosítva)
</div>)
_PR_ALL
