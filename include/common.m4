m4_define(_csoportositas,
`<a href="$1"><div class=stuff>
  <div class="stuff_icon">
    <img width=32 height=32 src="http://uzsolt.hu/static/pict/icons/folder.png" alt="Letöltés"/>
  </div>
  <div class="stuff_descr">
    $2
  </div>
</div></a>')

m4_define(_verseny_pdf,
`<a href="$1"><div class=stuff>
  <div class="pdf_icon"></div>
  <div class="stuff_descr">
    $2. tanév<br/>
    $3 évfolyam<br/>
    $4
  </div>
</div></a>')

m4_define(_own_pdf,
`<a href="$2"><div class="stuff">
  <div class=pdf_icon></div>
  <div class="stuff_descr">
    $1
    <span class="tooltip_bottom">$3</span>
  </div>
</div></a>')
