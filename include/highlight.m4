m4_define(`_highlight',`<div class=highlight><pre>m4_esyscmd'(`echo "'$1`" | highlight -f -S '$2)`</pre></div>')
m4_define(`_file_highlight',`<div class=highlight><pre>m4_esyscmd(cat $1 | highlight -f -S $2)</pre></div>')
