_LAYOUT(`note.m4',_title,`Subversion tároló tükrözése github-ra',_subtitle,`Subversion mirror into github')
_INCL(`highlight.m4')
<p>Először hozzuk létre a _HREF(`https://github.com',`GitHub')-on a _HREF(`https://help.github.com/articles/create-a-repo/',`tárolót').</p>
<p>A következő kód könnyen megérthető:</p>
_file_highlight(`src/notes/svn/svn-mirror-github.sh',sh)
<p>Ezután létrehozzuk az
<code>svn.yourdomain.com/repos/project_name/hooks/post-commit</code> fájlt:</p>
_file_highlight(src/notes/svn/svn-mirror-github-post-commit.sh,sh)
<p>És persze futtathatóvá tesszük:</p>
_highlight(`chmod +x svn.yourdomain.com/repos/project_name/hooks/post-commit',sh)
<p>Ekkor minden commit után a GitHub repository is automatikusan frissül.</p>
<p>Forrás: _HREF(`https://gist.github.com/ticean/1556967',`ticean bejegyzése')</p>
