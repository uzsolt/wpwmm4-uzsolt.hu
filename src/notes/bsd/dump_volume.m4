_LAYOUT(note.m4,_title,`dump multi-volume',_subtitle,`átnevezgetés nélkül')
_INCL(highlight.m4)
<p>Ha FreeBSD rendszerrel UFS fájlrendszert használunk, biztosan találkoztunk a
<a href=https://www.freebsd.org/cgi/man.cgi?dump%288%29>dump</a>
paranccsal. Ha mégsem, érdemes vetni rá egy pillantást (<a
href=https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/backup-basics.html>kézikönyvben</a>
vagy <a href=http://www.wonkity.com/~wblock/docs/html/backup.html>Warren
    Block oldalán</a> jó bevezetőt találsz).</p>
<p>Elképzelhető, hogy HDD/SSD-re történő <code>dump</code> esetén is
méretre akarod vágni a fájlokat, és nem akarod folyamatosan átnevezni a
dump-fájlokat. Ilyen hasznos eset lehet, ha a fájlrendszeren korlátozott
egy fájl mérete (a FAT-on kívül van még ilyen, mindennapos használatban?),
vagy esetleg fel akarod tölteni valahova, ahol korlátozott egy fájl mérete
(vagy csak mert egyszerűbb 20 darab 100 megás fájlt töltögetni, mint 1
darab 2 gigás fájlt).</p>
<p>Az alábbi parancs (amit saját igényeink szerint lehet változtatni) ezt
megoldja:</p>
_highlight(``dump -h 0 -B102400 -C16 -Luf \$(jot -w/var/dump/dump_%03d.dump -s , 100 1) /dev/sda1'',sh)
<p>A lényegi rész nyilván a <a href=https://www.freebsd.org/cgi/man.cgi?jot%281%29>jot</a>, 
de aki inkább a <a href=https://www.freebsd.org/cgi/man.cgi?seq%281%29>seq</a>-t
szereti, azzal is megoldhatja. A fenti <code>jot</code>-parancs 1-től
100-ig kiírja a számokat, elválasztóként a vesszőt használva
(<code>-s ,</code>), ui. a <code>dump</code> parancs így várja.</p>
<p>A <code>dump</code> így 100 Mb-s fájlokat hoz létre, a
_filename(`/var/dump') könyvtárba, _filename(`dump_001.dump'),
_filename(`dump_002.dump'), stb. nevekkel. Ha 100 fájlnál többet hozna
létre, kérdezni fog - persze a <code>jot</code> paramétereként 999 is
megadható, illetve a blokkméret (<code>-B</code>, kb-ban) növelhető.</p>
