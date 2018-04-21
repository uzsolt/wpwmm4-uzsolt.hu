_LAYOUT(`note.m4',_title,`pdfjam oldal válogatás',_subtitle,`különböző pdf-fájlokból')
_INCL(`highlight.m4')
<p>Sokszor lehet arra szükség arra, hogy <code>PDF</code>-fájlok bizonyos
oldalait másoljuk ki egy külön pdf-fájlba. Egyik lehetőség nyilván az,
hogy kinyomtatjuk egy PDF-fájlba a kívánt oldalakat - viszont ez a
lehetőség nem mindig érhető el.</p>
<p>Ha telepítve van a <code>pdfjam</code> program (ami általában valamely
<code>texlive</code>-csomag része (valószínűleg a <code>texlive-bin</code>
vagy <code>texlive-base</code>), akkor használhatjuk a következő formában:</p>
_highlight(``pdfjam --outfile valogatott_oldalak.pdf 1.pdf 1,5,6 2.pdf 2-5,8-'',sh)
<p>Ekkor az <code>1.pdf</code> fájl 1., 5. és 6. oldala, illetve a
<code>2.pdf</code> fájl 2-től 5-ig terjedő oldalai, illetve a 8. oldaltól
az összes oldal benne lesz a <code>valogatott_oldalak.pdf</code>
állományban.</p>
