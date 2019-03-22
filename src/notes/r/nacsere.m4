_LAYOUT(`note.m4',_title,`NA értékek cseréje',_subtitle,`bármire')
_INCL(`highlight.m4')
A _filename(`data') változó elemei között _filename(`NA') is szerepel.
Ezeket szeretnénk pl. _filename(`-1')-re cserélni:
_highlight(`
data[is.na(data)] <- -1',`R')
_HREF(`https://stackoverflow.com/a/8166616/934599',`(forrás)')
