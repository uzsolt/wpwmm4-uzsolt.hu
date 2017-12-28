_LAYOUT(`note.m4',_title,`Subversion és a taskwarrior',_subtitle,`vagy bármelyik verziókezelővel, akár GIT-tel')
_INCL(`highlight.m4')
m4_define(_onadd,`_filename(`~/.task/hooks/on-add')')m4_dnl
m4_define(_onmod,`_filename(`~/.task/hooks/on-modify')')m4_dnl
m4_define(_onexit,`_filename(`~/.task/hooks/on-exit')')m4_dnl
<p>Ha a _HREF(`https://taskwarrior.org/',`taskwarrior')-ral kezeljük a teendőinket, könnyen felmerülhet,
hogy a fájlokat verziókezelővel is kövessük. Ha nem akarjuk minden egyes <code>task</code>-futtatás után
a megfelelő verziókezelő <code>commit</code>-ját is futtatni, azaz automatikusan akarjuk a verziókezelést,
akkor a _HREF(`https://taskwarrior.org/docs/hooks.html',`hook') lehetőség jöhet szóba.</p>
<p>Az _onadd a hozzáadás <em>előtt</em>, az _onmod a módosítás <em>előtt</em>
fut le, így a verziókezelő (subversion, git, stb.) az _onexit-ben kell, hogy lefusson.</p>
<p>Az _onadd és az _onmod szkriptek létrehozzák a _filename(`commit_msg') fájlt, ami a verziókezelő commit-üzenete
lesz.</p>
<p>A szkriptek futásához szükség van a _HREF(`https://stedolan.github.io/jq/',`jq') programra.</p>
<p>A _onadd fájl:</p>
_file_highlight(`src/notes/svn/svn-taskwarrior-add.sh',`sh')
<p>A _onmod fájl:</p>
_file_highlight(`src/notes/svn/svn-taskwarrior-modify.sh',`sh')
<p>A _onexit fájl:</p>
_file_highlight(`src/notes/svn/svn-taskwarrior-exit.sh',`sh')
<p>Természetesen más verziókezelő is használható, az _onexit fájlban a megfelelő módosításokat végrehajtva.</p>
