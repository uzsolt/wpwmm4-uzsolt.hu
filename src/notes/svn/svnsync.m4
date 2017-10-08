_LAYOUT(`note.m4',_title,`SVN repository mirror',_subtitle,`svnsync használata')
_INCL(`highlight.m4')
<p>Ha bármilyen okból úgy érezzük, hogy a subversion repository-ról kell egy
tükör (mirror), akkor ez könnyen megoldható az <code>svnsync</code> parancs
segítségével.</p>
<p>Adott egy subversion tároló, legyen <code>svn://already.exist/myrepo</code>.
Ezt szeretnénk tükrözni (mirror), legyen <code>svn://mirror.server/myrepo</code>.</p>
<p>Ehhez először létre kell hozni a <code>mirror.server</code>-en a megfelelő
<code>myrepo</code>-t:</p>
_file_highlight(`src/notes/svn/svnsync_init.sh',sh)
<p>Ezután az <code>svnsync</code> parancs segítségével inicializálni kell:</p>
_highlight(`svnsync init --allow-non-empty svn://mirror.server/myrepo svn://already.exist/myrepo',sh)
<p>A szinkronizálás pedig a következő paranccsal történik:</p>
_highlight(`svnsync sync svn://mirror.server/myrepo',sh)
