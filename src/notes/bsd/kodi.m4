_LAYOUT(`note.m4',_title,`Kodi beállítása FreeBSD-hez',_subtitle,`Raspberry Pi-n')
_INCL(`highlight.m4')
<p>A leírás a FreeBSD _HREF(`https://www.freebsd.org/releases/11.1R/announce.html',11.1)-es verziójára érvényes.</p>
<h3>FreeBSD telepítése</h3>
<p>Ha még nem telepítettük a FreeBSD-t a Raspberry Pi-re, akkor tegyük meg!</p>
_highlight(`fetch https://download.freebsd.org/ftp/releases/ISO-IMAGES/11.1/FreeBSD-11.1-RELEASE-arm-armv6-RPI-B.img.xz',`sh')
<p>Természetesen az <code>RPI-B</code> verzió helyett választható az <code>RPI2</code> is, függően attól, hogy melyik RPi-nk van.</p>
<p>Ezután írjuk ki a kártyára:</p>
_highlight(`xz -d -c FreeBSD-11.1-RELEASE-arm-armv6-RPI-B.img.xz | dd of=/dev/CARDDEVICE bs=1m conv=sync',`sh')
<h3>Kodi telepítése és beállítása</h3>
<p>Boot után a <code>freebsd</code> felhasználónévvel és <code>freebsd</code> jelszóval léphetünk be SSH-n.
A _HREF(`https://www.freebsd.org/cgi/man.cgi?query=su',`su') segítségével
root felhasználóvá válhatunk, és telepíthetjük a _filename(`kodi')-t:</p>
_highlight(`pkg install kodi',`sh')
<p>A _filename(`/boot/msdos/config.txt') fájlban a <code>gpu_mem</code> értékét <code>128M</code>-re illetve Pi2 esetén <code>256M</code>-re kell állítani.</p>
<p>Érdemes létrehozni jogosultságok miatt a _filename(`/etc/devfs.conf') fájlt:</p>
_highlight(`
own vchiq root:wheel
perm vchiq 0660',`sh')
<p>Ezután a _filename(`kodi-standalone') vagy _filename(`kodi --standalone') paranccsal indíthatjuk.</p>
<h3>Egér nélküli webserver-aktiválás</h3>
<p>Ha nincs közvetlen fizikai hozzáférésünk az RPi-hez (egér, billentyűzet), akkor érdemes a _filename(`~/.kodi/userdata/advancedsettings.xml')
fájlt létrehozni a következő tartalommal:</p>
_highlight(`
<advancedsettings>
  <services>
    <esallinterfaces>true</esallinterfaces>
    <webserver>true</webserver>
    <zeroconf>true</zeroconf>
  </services>
</advancedsettings>',`xml')
<p>Illetve a _filename(~/.kodi/userdata/guisettings.xml) fájlban a következő értékeket <em>true</em>-ra állítani
(_HREF(`http://kodi.wiki/view/Web_interface',`forrás')):</p>
<ul>
<li>&lt;esallinterfaces&gt; &rarr; <strong>true</strong></li> 
<li>&lt;webserver&gt; &rarr; <strong>true</strong></li> 
<li>&lt;zeroconf&gt; &rarr; <strong>true</strong></li> 
</ul>
<h3 id="inetd">Automatikus Kodi-indulás (on-request)</h3>
Ha nem akarjuk feleslegesen pazarolni az RPi (korábbi verziókban igen szűkös) erőforrásait, akkor egy megoldás lehet,
ha az _HREF(`https://www.freebsd.org/doc/handbook/network-inetd.html',`inetd') segítségével indítjuk automatikusan:
<ol>
<li>A _filename(`/etc/services') fájlba vegyük fel a _highlight(`kodi 9090/tcp',`sh')</li>
<li>A _filename(`/etc/inetd.conf') fájlba pedig a _highlight(`kodi stream tcp nowait/1/1 USER /home/USER/bin/start-kodi-inetd',`sh')</li>
<li>A _filename(`/home/USER/bin/start-kodi-inetd') tartalma pedig legyen _file_highlight(`src/notes/bsd/start-kodi-inetd',`sh')
Persze a <code>printf</code>-es részek elhagyhatóak. A <code>HOME</code> beállítása viszont szükséges, különben a Kodi hibával kilép. Azért nem
a _filename(`/usr/local/bin/kodi')-t használjuk indításra, mert ha nem nulla visszatérési értékkel fejeződik be a Kodi futása, automatikusan
újraindítja - ezt pedig nem akarjuk.
</li>
<li>Vegyük fel a _filename(`/etc/rc.conf')-ba a _highlight(`inetd_enable="YES"',`sh') sort, majd Indítsuk el
az _filename(`inetd') szervert: _highlight(`service inetd start',`sh')</li>
</ol>
A _HREF(`https://yatse.tv/redmine/projects/yatse',`Yatse') androidos távirányítóval jól működik, a _HREF(`https://kodi.wiki/view/Kore',`Kore') valamiért
nem tud csatlakozni, ha az _filename(`inetd') indítja a Kodi-t.
<h3>Megjegyzés</h3>
<p>Ha régi CRT (katódsugárcsöves) TV-nk van, akkor a _filename(`/boot/msdos/config.txt') fájlba a</p>
_highlight(`sdtv_mode=2',`sh')
<p>sort kell felvenni, amellyel PAL szabványt kényszerítünk ki
(_HREF(`https://www.raspberrypi.org/documentation/configuration/config-txt/video.md',`forrás')).</p>
