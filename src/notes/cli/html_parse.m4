_LAYOUT(`note.m4',_title,`HTML feldolgozás',_subtitle,`HTML feldolgozás céleszközökkel')
_INCL(`highlight.m4')
Egy HTML oldal letöltésekor sokszor felmerül az igény, hogy a honlapon található
összes képet mentsük le, vagy az összes PDF-fájlt, amire mutat link.

Ehhez a <a href=https://www.w3.org/Tools/HTML-XML-utils/>HTML-XML-utils</a>
programcsomag lehet a segítségünkre, amely a legtöbb disztribúcióban
megtalálható.

A következő parancs kilistázza az ezen az oldalon található összes matematika
OKTV feladatsort:

_highlight(`curl http://uzsolt.hu/comp/math/oktv/ | hxnormalize -l 300 | hxwls | grep pdf',sh)

A <code>curl</code> paranccsal a standard kimenetre (stdout) küldjük a honlap
tartalmát, a <code>hxnormalize</code> paranccsal szabványosítunk
(a <code> -l 300</code> paraméter 300 karakteres sorokat hoz létre, ennyi
elégnek kell lennie), a <code>hxwls</code> a linkeket gyűjti ki, a 
<code>grep pdf</code> pedig azokat a sorokat listázza, amelyekben található a
<code>pdf</code> karaktersorozat.

Parancsbehelyettesítéssel akár le is tölthetjük az összes PDF-fájlt.
