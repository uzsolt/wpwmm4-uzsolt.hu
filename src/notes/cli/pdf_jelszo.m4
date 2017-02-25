_LAYOUT(`note.m4',_title,`PDF jelszó eltávolítás',_subtitle,`jelszó ismeretében')
_INCL(`highlight.m4')
<p>Ha kapunk egy jelszóval védett PDF-fájlt (a jelszóval együtt), hasznos lehet,
ha lemásolhatnánk a PDF-fájlt jelszó nélküli verzióba. Ehhez a művelethez
<a href=http://www.ghostscript.com/>Ghostscript</a>-et hívjuk segítségül:
_highlight(`gs -sPDFPassword=JELSZÓ -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=%stdout% -c .setpdfwrite -f locked.pdf > unlocked.pdf',sh)
Ez a parancs a <code>locked.pdf</code>, jelszóval védett fájlból állítja elő az
azonos tartalommal rendelkező, jelszóval nem védett <code>unlocked.pdf</code>
fájlt. Értelemszerűen a <code>JELSZÓ</code> helyett az ismert jelszó írandó.</p>
