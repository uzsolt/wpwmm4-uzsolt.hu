_LAYOUT(`note.m4',_title,`RSync, transmission',_subtitle,`Transmission szerver RPI-n')
_INCL(`highlight.m4')
<p>Adott egy Raspberry PI, amelyen egy <a href=http://www.transmissionbt.com/>Transmission</a> szerver fut.</p>
<p>A feladat, hogy az asztali (ill. laptop) gépre letöltött <code>.torrent</code> fájlokat az RPI betöltse, és
töltse le.</p>
<p>Azt a megoldást választottam, hogy az RPI-n egy ellenőrző szkript lefut, amely a csatlakozott
asztali gépek adott könyvtárából <a href=https://rsync.samba.org/>rsync</a>-kel átmásolja (és törli)
a torrent fájlokat. A transmission a cél-könyvtárat figyeli.</p>

_highlight(#!/bin/sh

PATH=/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin

RSYNC=\"rsync -q -e ssh --remove-source-files -r --include '*.torrent' --exclude '*' \"
TORRENTDIR=\"/usr/home/hdd/torrent/torrentek/\"

if ping -q -c 1 -t 2 HOST1 >/dev/null; then
        eval \${RSYNC} USER1@HOST1:HOST1DIR \${TORRENTDIR} > /dev/null 2>&1
fi

if ping -q -c 1 -t 2 HOST2 >/dev/null; then
        eval \${RSYNC} USER2@HOST2:HOST2DIR \${TORRENTDIR} > /dev/null 2>&1
fi,sh)
