_LAYOUT(`note.m4',_title,`Bluetooth audio HIFI-vel',_subtitle,`FreeBSD-n')
_INCL(`highlight.m4')
_OL(
  `_highlight(`hccontrol -n ubt0hci inquiry',`sh') segítségével a
		_filename(BD_ADDR) kiolvasható',
  `csatlakozás HIFI-hez:
    _highlight(`hccontrol -n ubt0hci create_connection BD_ADDR',`sh')',
  `a _HREF(`https://www.freshports.org/audio/virtual_oss/',`virtual_oss')
    telepítése:
    _highlight(`pkg install virtual_oss',`sh')',
  `egy új hangeszköz létrehozása:
    _highlight(`/usr/local/sbin/virtual_oss -C 2 -c 2 -r 48000 -b 16 -s 1024 -R /dev/null -P /dev/bluetooth/BD_ADDR -d dsp',`sh')',
  `Ha minden jól megy, most már mennie kellene.'
)
<p>(m4_patsubst(`$Módosítva$',`\$',`'))</p>
