_LAYOUT(`note.m4',_title,`Automatikus kihagyás, más kiterjesztéssel',_subtitle,`Automatic ignore different extension')
_INCL(`highlight.m4')
<p>A dokumentumaimat LaTeX-fájlokban szerkesztem, és felmerült, hogy jó lenne, ha
egy <code>foo.tex</code>-fájl létrejöttével egyidőben bővülne az <code>svn:ignore</code>
a <code>foo.pdf</code> fájllal.</p>
<p>A megoldás nyilván egy _HREF(`http://svnbook.red-bean.com/nightly/en/svn.ref.reposhooks.html',`hook') létrehozása, praktikusan egy
_HREF(`http://svnbook.red-bean.com/nightly/en/svn.ref.reposhooks.post-commit.html',`post-commit') hook.</p>
_file_highlight(`src/notes/svn/automatic-ignore.sh',`sh')
