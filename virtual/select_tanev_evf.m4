m4_divert(-1)
m4_define(_csoportositas,
<a href="$1"><div class=stuff>
  <div class="stuff_icon">
    <img width=32 height=32 src="http://uzsolt.hu/static/pict/icons/folder.png" alt="Letöltés"/>
  </div>
  <div class="stuff_descr">
    $2
  </div>
</div></a>)
m4_divert(0)m4_dnl
<!DOCTYPE html>
<html>
<head>m4_include(01_header.m4)</head>
<body>
_SCRIPT(genmenu.pl /_DIRECTORY)
<div id="content">
_csoportositas(evf.html,Évfolyamonként csoportosítva)
_csoportositas(tanev.html,Tanévenként csoportosítva)
</div>
</body>
</html>
