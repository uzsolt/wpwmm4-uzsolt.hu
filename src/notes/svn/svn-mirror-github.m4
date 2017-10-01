_LAYOUT(`note.m4',_title,`Subversion tároló tükrözése github-ra',_subtitle,`Subversion mirror into github')
_INCL(`highlight.m4')
<p>Először hozzuk létre a _HREF(`https://github.com',`GitHub')-on a _HREF(`https://help.github.com/articles/create-a-repo/',`tárolót').</p>
<p>A következő kód könnyen megérthető:
_file_highlight(`src/notes/svn/svn-mirror-github.sh',sh)</p>
<p>Ezután létrehozzuk az
<code>svn.yourdomain.com/repos/project_name/hook/post-commit</code> fájlt:
_file_highlight(src/notes/svn/svn-mirror-github-post-commit.sh,sh)</p>
<p>És persze futtathatóvá tesszük:
_highlight(`chmod +x svn.yourdomain.com/repos/project_name/hook/post-commit',sh)</p>
<p>Ekkor minden commit után a GitHub repository is automatikusan frissül.</p>
<p>Forrás: _HREF(`https://gist.github.com/ticean/1556967',`ticean bejegyzése')</p>
