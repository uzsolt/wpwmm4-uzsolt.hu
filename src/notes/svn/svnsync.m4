_LAYOUT(`note.m4',_title,`SVN repository mirror',_subtitle,`svnsync használata')
_INCL(`highlight.m4')
<p>Ha bármilyen okból úgy érezzük, hogy a subversion repository-ról kell egy
tükör (mirror), akkor ez könnyen megoldható az <code>svnsync</code> parancs
segítségével.</p>
<p>Adott egy subversion tároló, legyen _filename(`svn://already.exist/myrepo').
Ezt szeretnénk tükrözni (mirror), legyen _filename(`svn://mirror.server/myrepo').</p>
<p>Ehhez először létre kell hozni a _filename(`mirror.server')-en a megfelelő
_filename(`myrepo')-t:</p>
_file_highlight(`src/notes/svn/svnsync_init.sh',sh)
<p>Ezután az <code>svnsync</code> parancs segítségével inicializálni kell:</p>
_highlight(`svnsync init --allow-non-empty svn://mirror.server/myrepo svn://already.exist/myrepo',sh)
<p>A szinkronizálás pedig a következő paranccsal történik:</p>
_highlight(`svnsync sync svn://mirror.server/myrepo',sh)
<p>Érdemes a hozzáférést a <code>mirror</code>-hoz korlátozni, hiszen ha véletlenül a
<code>mirror</code>-ba <code>commit</code>-olunk, akkor a tükrözést ezzel elrontjuk
(hiszen a kiindulási repository-ban ez a commit nincs benne). Ennek lehetőségei:
<ul>
<li><code>svn://</code>: az _filename(`authz') fájlban írásjogot csak egy külön,
erre a célra létrehozott felhasználónak adunk. Mindig az ő nevében fut az
<code>svnsync</code>.</li>
<li><code>http://</code>: hasonlóan, mint előbb</li>
<li><code>file://</code> és <code>svn+ssh://</code>: egy külön felhasználót hozunk
létre a mirror rendszerében, és a mirror repository ennek a felhasználónak a
tulajdonában lesz. Egyéb helyre a <code>checkout</code> <em>ne</em> ezzel a felhasználóval
történjen, így biztosítjuk, hogy neki csak olvasási joga legyen.</li>
</ul>
</p>
