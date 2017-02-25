_LAYOUT(note.m4,_title,`Videókonvertálás',_subtitle,`asztali DVD-lejátszók számára')
_INCL(highlight.m4)
<p>A legtöbb asztali DVD-lejátszó korlátozott képeségekkel bír, legalábbis ami a
lejátszható formátumokat illeti. Túl nagy a file-méret, túl hosszú a lejátszási
idő, túl nagy/túl kicsi bitrátával lett tömörítve, stb.</p>
<p>Némi nyomozgatás után úgy találtam, hogy az
<a href=https://www.ffmpeg.org/>ffmpeg</a> eszköz segítségével az alábbi módon
egy egész emészthető formátumot lehet produkálni:
_highlight(`ffmpeg -i INPUTFILE.EXT -c:a libmp3lame -c:v libxvid -b:v 2000k OUTPUT.AVI',sh)

A bitráta (2000k) lehet kisebb is.

<p>Az <a href=https://trac.ffmpeg.org/wiki/Encode/MPEG-4>ffmpeg</a>
dokumentációja változó bitrátát javasol:</p>
_highlight(`ffmpeg -i INPUTFILE.EXT -c:a libmp3lame -c:v libxvid -q:v 2 OUTPUT.AVI',sh)
