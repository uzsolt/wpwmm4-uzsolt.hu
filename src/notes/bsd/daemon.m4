_LAYOUT(`note.m4',_title,`Daemon',_subtitle,`Ellenőrzött program futtatás')
_INCL(`highlight.m4')
A <code>/usr/sbin/daemon</code> program alkalmas, hogy 
egy program folyamatosan fusson a háttérben, 
kilépés esetén újrainduljon. 

Rendkívül hasznos lehet, ha valamit pl. 5 másodpercenként 
akarunk futtatni: egy 
_highlight(`while true; do 
    ...
    sleep 5
done',`sh')
ciklusba ágyazhatjuk az ötmásodpercenként futtatni 
kívánt programot. 

Egyszerű, nem kell külön szkriptet írni a figyelésre, stb. 
