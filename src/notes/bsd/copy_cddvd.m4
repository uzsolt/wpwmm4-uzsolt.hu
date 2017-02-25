_LAYOUT(`note.m4',_title,`CD és DVD másolása',_subtitle,`dd használatával')
_INCL(`highlight.m4')
CD ill. DVD másolásakor belefuthatunk egy FreeBSD-specifikus hibába.
Ennek feloldására a <code>dd</code> <code>blocksize</code> paraméterének
adjunk 2048-at, azaz
_highlight(`dd if=/dev/cd0 of=dvd.iso blocksize=2048',`sh')
