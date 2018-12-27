_LAYOUT(`note.m4',_title,`Pedagógus bértábla',_subtitle,`Bértábla levezetése')
m4_define(`_vetalap',`101500')m4_dnl
m4_define(`_vetalaptvurl',`https://net.jogtar.hu/jogszabaly?docid=A1800050.TV')m4_dnl
m4_define(`_vetalaptv',`2019-re szóló költségvetési törvény')m4_dnl
m4_define(`_vetalaptvpar',`62')m4_dnl
m4_define(`_szazkozep',`120')m4_dnl
m4_define(`_szazbsc',`180')m4_dnl
m4_define(`_szazmsc',`200')m4_dnl
m4_define(`_ilalapkozep',m4_eval(_vetalap*_szazkozep/100))m4_dnl
m4_define(`_ilalapbsc',m4_eval(_vetalap*_szazbsc/100))m4_dnl
m4_define(`_ilalapmsc',m4_eval(_vetalap*_szazmsc/100))m4_dnl
m4_dnl A kategóriák 3 évenként ugranak
m4_dnl A fizetési százalékok kategóriánként 5 százalékot, kivéve Ped 1., 2->3. kategória, ott 10%
m4_define(`pedakat',`2')m4_define(`pedasz',`120')m4_dnl
m4_define(`pedbkat',`4')m4_define(`pedbsz',`150')m4_dnl
m4_define(`pedckat',`6')m4_define(`pedcsz',`200')m4_dnl
m4_define(`peddkat',`6')m4_define(`peddsz',`220')m4_dnl
m4_define(`pedevmax',`45')m4_dnl
<h3>Vetítési alap, illetményalap, pótlékok</h3>
<p>A <em>vetítési alap</em> a _HREF(_vetalaptvurl,_vetalaptv) _vetalaptvpar. § szerint
_vetalap Ft.</p>
<p>A _HREF(`https://net.jogtar.hu/jogszabaly?docid=A1100190.TV',`Köznevelési törvény') 65. § (2) szerint az <em>illetményalap</em></p>
_UL(`középfokú végzettség esetén _szazkozep%, azaz _ilalapkozep Ft',
`alapfokozat (BSc) esetén _szazbsc%, azaz _ilalapbsc Ft',
`mesterfokozat (MSc) esetén _szazmsc%, azaz _ilalapmsc Ft')
<p>A pótlékok (osztályfőnöki, munkaközösség-vezetői, intézményvezetői, stb.)
a <em>Köznevelési törvény</em> 8. mellékletében vannak felsorolva.</p>
<p>A pótlékok törvényben meghatározott minimális és maximális mértéke
az <em>illetményalap</em> megfelelő százaléka, azaz értéke nem változik
a fizetési kategória vagy minősülés után, csak végzettség emelkedésekor.</p>
<p>A táblázat <q>fizetési</q> celláiban az első sor az illetményalap százaléka,
a második-harmadik-negyedik sorok rendre a középfokú, BSc, MSc végzettség
esetén a pótlék összege.
<table class="bertabla">
<caption>Pótlékok táblázata.
<br/>Forrás: hivatkozott törvények, saját számítások.</caption>
<tr>
  <th>Pótlék megnevezése</th>
  <th>Pótlék alsó határa</th>
  <th>Pótlék felső határa</th>
</tr>
m4_esyscmd(scripts/ped_tabla_0.sh _ilalapkozep _ilalapbsc _ilalapmsc)
</table>

<h3>Bértábla</h3>
<p>A bértábla a törvényben forintosítva nem szerepel, viszont a fenti
adatokból kiszámolható.</p>
<p>A <em>Kategória</em> oszlop a fizetési kategóriát jelenti,
az <em>Év</em> oszlop pedig a köznevelésben eltöltött
gyakorlati évek számát (természetesen az évek számától függ a kategória).</p>
<p>Minden <q>fizetési</q> cella első sora az <em>illetményalap</em> százaléka,
a második-harmadik-negyedik sor pedig rendre a
<em>középfokú</em>, <em>BSc</em> és <em>MSc</em> végzettség
esetén a bér (azaz a megfelelő illetményalap megadott százaléka).</p>
<p>Az első fizetési fokozatban (1. kategória, lényegében a <em>Gyakornok</em>
besorolás) az illetményalap 100%-a a bér.</p>

<table class="bertabla">
<caption>Pedagógus bértábla.<br/>Forrás: hivatkozott törvények, saját számítás.</caption>
<tr>
  <th class="kateg">Kategória</th>
  <th class="kateg">Év</th>
  <th class="besorolas">Pedagógus I.</th>
  <th class="besorolas">Pedagógus II.</th>
  <th class="besorolas">Mesterpedagógus</th>
  <th class="besorolas">Kutatótanár</th>
</tr>
<tbody>
m4_esyscmd(scripts/ped_tabla_1.sh pedakat pedasz pedbkat pedbsz pedckat pedcsz peddkat peddsz pedevmax _ilalapkozep _ilalapbsc _ilalapmsc)
</tbody>
</table>
<p><b>Megjegyzés:</b>
a fenti táblázatok nem hivatalosak,
nem alkalmasak hivatalos közlésre és felhasználásra,
csak tájékozódásra felelnek meg.</p>
<p>(m4_patsubst(`$Módosítva$',`\$',`'))</p>
