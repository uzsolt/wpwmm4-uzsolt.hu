m4_divert(-1)
m4_include(common.m4)
m4_divert(0)m4_dnl
<!DOCTYPE html>
<html>
<head>m4_include(01_header.m4)</head>
<body>
_SCRIPT(genmenu.pl /_DIRECTORY)
<div id="content">
_SCRIPT(pdfitems.sh /_DIRECTORY)
</div>
</body>
</html>
