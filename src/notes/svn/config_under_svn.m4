_LAYOUT(`note.m4',_title,`Subversion konfigurációs állományok verziókezelése',_subtitle,`subversion configuration under versioning')
_INCL(`highlight.m4')
<p>A subversion konfigurációs fájljait illetve a hook-okat is érdemes lehet a verziókezelő hatáskörébe tenni.
Első pillantásra talán annyira nem egyszerű, de némi ötlet segítségével könnyen megoldható.</p>
_OL(
`létrehozunk egy új project-et: _highlight(`svnadmin create svnadmin',`sh')',
`working copy létrehozása: _highlight(`svn checkout svn://svn.server/svnadmin',`sh')',
`létrehozzuk az svn szerverek könyvtárait: _highlight(`svn mkdir server1 server2 server3',`sh')',
`a szerverek könyvtárain belül a projektek könyvtárait:
  _highlight(``svn mkdir --parents server1/{project1,project2}/{conf,hooks} server2/{project3,project4}/{conf,hooks}'',`sh')',
`az _filename(`svn.server/svnadmin/hooks') könyvtárban létrehozunk egy _filename(`post-commit')
  _HREF(`https://svn.uzsolt.hu/svnadmin/localhost/svnadmin/hooks/post-commit?view=markup',`hook')-ot, amely majd mindig
  a megfelelő helyre másolja a változtatott állományt. Persze ezt is verziókezelő alá lehet venni :)'
)
<p>Amit használok, annak a fájljai _HREF(`https://svn.uzsolt.hu/svnadmin/',`itt') megtalálhatóak.</p>
