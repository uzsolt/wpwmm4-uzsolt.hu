m4_divert(-1)
_INCL(common.m4)
m4_define(`_kep',`<div class="center"><img src="$1" alt="$2"/></div>')
m4_define(`_kieg',`<h3>Saját kiegészítésem (Udvari Zsolt)</h3>')
_LAYOUT_PRE(`<div id="content">')
_2_BODY(<h1>_title</h1>)
_2_BODY(<h2>_subtitle</h2>)
_2_BODY(<h3>(Lantos Gábor eredeti bejegyzése _HREF(`https://statisztikaegyszeruen.blog.hu/'_originalpost,`itt'))</h3>)
_LAYOUT_POST(`</div>')
