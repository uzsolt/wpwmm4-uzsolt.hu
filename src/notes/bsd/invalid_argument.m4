_LAYOUT(`note.m4',_title,`Invalid argument',_subtitle,`javítása')
_INCL(`highlight.m4')
<p>A pendrive-on megjelent kettő furcsa fájl, aminek hatására az <code>ls</code> és
bármi, ami listázni akart, furcsa üzeneteket írt ki:</p>
_highlight(`ls: Fizika 9 Ismertet?.pdf: Invalid argument',`sh')
<p>A pendrive FAT fájlrendszerrel bír, azaz a <code>mount_msdosfs</code>-sel
csatoljuk. A fájl még fájlkezelővel sem törölhető.</p>
<p>A megoldás _HREF(`https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=217440#c9',i`itt')
található, a lényege, hogy a csatolást így végezzük el:</p>
_highlight(`mount_msdosfs -L en_US.UTF-8 /dev/da0s1 tmp/',`sh')
<p>Ezután a kérdéses fájl törölhető, vagy átnevezhető.</p>
<p>(m4_patsubst(`$Módosítva$',`\$',`'))</p>
