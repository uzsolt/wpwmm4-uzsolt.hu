m4_define(_csoportositas,
`<a href="$1"><div class="stuff" title="$3">
  <div class="stuff_icon">
    <img width=32 height=32 src="http://uzsolt.hu/static/pict/icons/folder.png" alt="Letöltés"/>
  </div>
  <div class="stuff_descr">
    $2
  </div>
</div></a>')

m4_define(_verseny_pdf,
_own_pdf(`$2. tanév<br/>$3 évfolyam<br/>$4',
  `$1',
  `_ACTIVEMENU $2. tanév<br/>$3. évfolyam<br/>$4'
  )
)

m4_define(_own_pdf,
`<a href="$2"><div class="stuff" title="$3">
  <div class=pdf_icon></div>
  <div class="stuff_descr">
    $1
  </div>
</div></a>')

m4_define(_include_menu,`m4_include(menu/_DIRECTORY/menu.gen)')

m4_define(_filename,`<span class="filename">$1</span>')
