_LAYOUT(`note.m4',_title,`BIOS flash (update)',_subtitle,`FreeBSD-n')
_INCL(`highlight.m4')
<p>Ha a számítógépünkön a BIOS-t frissíteni szeretnénk, és van is rá elérhető
frissítés, akkor ha nincs Windows a gépünkön, bajban lehetünk,
ui. a legtöbb esetben egy _filename(`exe')-fájlt adnak.</p>
<p>A probléma megoldása lehet, ha a _HREF(`http://www.freedos.org/',`FreeDOS')-t
használjuk.</p>
<p>Lépések:</p>
<ol>
<li>Töltsük le az _HREF(`http://www.freedos.org/download/download/FD12LITE.zip',`USB "Full" installer')
zip-fájlt _HREF(`http://www.freedos.org/download/',`innen').</li>
<li>Tömörítsük ki: _highlight(`unzip FD12LITE.zip',`sh')</li>
<li>Egy üres pendrive-ra a _filename(`FD12LITE.img') fájlt írjuk ki:
_highlight(`dd if=FD12LITE.img of=/dev/da0 bs=1M',`sh')</li>
<li>Ezzel a pendrive-on létrejön egy kb. 30Mb-os _filename(`da0s1') partíció. A pendrive többi része nincs használatban, majd ide másoljuk a fájlt.</li>
<li>A pendrive többi részét is vegyük használatba:
_highlight(`gpart add -t fat16 da0
newfs_msdos /dev/da0s2',`sh')</li>
<li>Felcsatoljuk és rámásoljuk a BIOS update fájlt:
_highlight(`mount_msdosfs /dev/da0s2 /media/
cp BIOS_FLASH.exe /media/',`sh')</li>
<li>Ezután a számítógépet újraindítjuk (_filename(`reboot')), a
_filename(`FreeDOS')-t tartalmazó USB-pendrive-ról indulunk, majd a
_filename(`da0s2') partíciót _filename(`D:') meghajtóként érjük el:
_highlight(`D:
BIOS_FLASH.exe',`sh')</li>
<li>Happy End</li>
</ol>
