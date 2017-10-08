_LAYOUT(`note.m4',_title,`GIT repository konvertálása SVN-re',_subtitle,`egyszerű esetekben')
_INCL(`highlight.m4')
<p>A _HREF(`https://git-scm.com/',`GIT') a legnépszerűbb verziókezelők egyike, mégis lehetnek olyan esetek, amikor
inkább egy másik szoftvert választunk e célra - jelen esetben a _HREF(`https://subversion.apache.org/',`Subversion')-ra.</p>
<p>Próbáltam néhány leírást a konverzióról, de egy öszvér-megoldás segítségével sikerült megoldani. A lépések:</p>
_file_highlight(src/notes/svn/git2svn.sh,sh)
<p>Ezzel a módszerrel néhány GIT-repót sikerült SVN-re konvertálni.</p>
<p>Források:
_HREF(`http://sandrotosi.blogspot.hu/2010/02/migrate-git-repo-to-svn-one.html',`sandrotosi.blogspot')
és
_HREF(https://stackoverflow.com/questions/2771033/git-svn-object-doesnt-exist-in-the-repository-at-opt-local-libexec-git-cor/,`stackoverflow válasz')</p>
<p>Hasznos lehet a commit-ok idejének (timestamp) megőrzése is. Ha egyszerű a git-tároló, viszonylag egyszerűen megoldható:</p>
_file_highlight(src/notes/svn/git2svn_time.sh,sh)
