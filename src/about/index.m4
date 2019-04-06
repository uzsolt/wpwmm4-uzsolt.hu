_LAYOUT(`note.m4',_title,`Információk',_subtitle,`Rólam és a honlapról')
_DIVB(`div_about')
  <h3>Gyors szakmai áttekintés</h3>
  <p>2005. szeptembere óta a _HREF(`http://www.bgrg.hu',`Bethlen Gábor Református Gimnáziumban') tanítok fizikát és 
  matematikát. 2012. szeptembere óta a matematika munkaközösség vezetője vagyok.</p>

  <p>Önéletrajzom letöltheted _HREF(`http://uzsolt.hu/static/oneletrajz.pdf',`innen').</p>
_DIVE
_DIVB(`div_about')
  <h3>Rendszerinformáció</h3>
  <p>Az oldal egy _HREF(`https://hu.wikipedia.org/wiki/Virtu%C3%A1lis_dedik%C3%A1lt_szerver',`VPS')-en fut. 
  A használt operációs rendszer _HREF(`http://www.freebsd.org/',`FreeBSD') 11.2.</p>
  
  <p>Webszerverként _HREF(`http://nginx.com/',`nginx') fut.</p>
  
  <p>Az oldal <em>legkorábbi verzióját</em> saját fejlesztésű
  _HREF(`http://php.net/',`PHP')-szkriptek generálták, 
  a megjelenítendő adatok 
  _HREF(`https://mariadb.org/',`MariaDB') (_HREF(`http://www.mysql.com/',`MySQL')-fork) 
  adatbázisban tárolva.</p>

  <p><em>Egy későbbi verzióban</em> statikus HTML-ek segítségével jelenik meg a böngészőn az oldal.
  A HTML-fájlokat a _HREF(`http://jekyllrb.com/',`jekyll') generálja. Az
  adatok _HREF(`https://en.wikipedia.org/wiki/Comma-separated_values',`CSV-fájlokban')
  tárolva.</p>

  <p><em>Jelenleg</em> statikus HTML-ek szolgálják az információ olvashatóvá tételét,
  viszont ezeket már egy saját fejlesztésű eszköz, a _HREF(`https://svn.uzsolt.hu/wpwmm4',`wpwmm4')
  generálja. A forrás _HREF(`https://svn.uzsolt.hu/uzsolt.hu/wpwmm4-uzsolt.hu/',`itt') megtekinthető.</p>
  
  <p>Nem vagyok webdesigner, így a külcsín esetleg hagy némi kívánnivalót maga után, de remélem, 
  hogy az oldal használhatósága, egyszerűsége, gyorsasága ellensúlyozza ezt a hiányosságot.</p> 

  <p>Az oldal NEM használ _HREF(`https://hu.wikipedia.org/wiki/HTTP-s%C3%BCti',`sütiket') (cookie),
  így nem kell se elfogadni, se megérteni a velük kapcsolatos dolgokat.</p>
_DIVE
_DIVB(`div_about')
  <h3>Kapcsolat</h3>
  <p>Bármilyen ügyben az 
  <a href="mailto:uzsolt@uzsolt.hu">uzsolt<img src="http://uzsolt.hu/static/pict/icons/kukac.png" width=16 height=16 alt="KUKAC"/>uzsolt.hu</a>
  e-mail címen veheted fel velem a kapcsolatot.</p>
_DIVE
<p>(m4_patsubst(`$Módosítva$',`\$',`'))</p>
