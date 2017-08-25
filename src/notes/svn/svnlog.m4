_LAYOUT(`note.m4',_title,`Subversion commit message változtatása',_subtitle,`')
_INCL(`highlight.m4')
<p>Először is szükséges, hogy legyen <code>pre-revprop-change</code>-hook. Ha még nincs, akkor:
_highlight(cd /svn/repo/hooks
cp pre-revprop-change.tmpl pre-revprop-change,sh)
Ezután
_highlight(svn propedit svn:log --revprop -r REVNR,sh)
És már lehet is szerkeszteni.</p>
