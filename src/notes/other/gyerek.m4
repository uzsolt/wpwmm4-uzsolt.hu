_LAYOUT(`note.m4',_title,`Gyerekvállalás',_subtitle,`Hivatalos teendők')
<p>Minden orvosi beutalót a háziorvos ad. A terhességet a nőgyógyász igazolja.</p>
_UL(`területileg illetékes védőnő felkeresése, amikor már biztos a terhesség',
  `vérvételnél _HREF(`https://hu.wikipedia.org/wiki/Toxoplazm%C3%B3zis',`toxoplazmózis')
  vizsgálat kérhető (3500 forint)'
  _UL(
    `csekk a _HREF(`https://kormanyablak.hu/hu',`Kormányablaknál') kérhető,
      a <em>Népegészségügyi osztályon</em>',
    `a vérvételre a befizetett csekkel kell menni',
    ``ha <em>pozitív</em>, azt jelenti, hogy a fertőzésen átesett'',
    ``ha <em>negatív</em>, azt jelenti, hogy a fertőzésen még nem esett át -
      veszélyes lehet, ha a fertőzésen a terhesség alatt esik át, ekkor
      legközelebb is érdemes a tesztet megcsináltatni
      (ami természetesen még egyszer 3500 forint `&#9786;')''
  ),
  _HREF(`https://www.nav.gov.hu/nav/ado/szja/A_csaladi_kedvezmeny_20170105.html',
    `családi adó- és járulékkedvezmény')
  _UL(
    `a nőgyógyász adja az igazolást a terhesség 91. napjától',
    ``mindkét fél kitölt egy papírt, amennyiben megosztják;
      ha nem, akkor elég az igénybevevő fél munkahelyén egy papírt
      leadni, melyet mindketten aláírtak'',
    `leegyszerűsítve: havonta <em>eltartottanként</em> az alábbi összegekkel
      csökkentendő az SZJA, majd az egészségbiztosítási járulék(ok), majd
      a nyugdíjjárulék (_HREF(`http://www.njt.hu/cgi_bin/njt_doc.cgi?docid=24312.285031',``SZJA-törvény, 29/A. §'')):'
      _UL(
        `egy eltartott esetén 10&nbsp;000 forint',
        `két eltartott esetén 15&nbsp;000 forint',
        `három vagy annál több eltartott esetén <em>eltartottanként</em>
          33&nbsp;000 forint',
        `az _HREF(`https://www.nav.gov.hu/nav/ado/szja/Tajekoztato_az_elso_hazasok_kedvezmenyei.html',`első házasok kedvezményére')
          (havi 5000 forint) való jogosultság nem szűnik meg!'
          
      )
  ),
  _HREF(`https://cst.tcs.allamkincstar.gov.hu/ell%C3%A1t%C3%A1sok/gyermekgondoz%C3%A1si-seg%C3%A9ly.html',`GYES (gyermekgondozást segítő ellátás)')
  _UL(
    `mindenkinek jár, alanyi jogon',
    `a gyermek 3. életévének betöltéséig'
    `összege az _HREF(`https://nfsz.munka.hu/Allaskeresoknek/Lapok/allaskeresoknek_ellatasok/allaskeresoknek_tajekoztato_oregsegi_nyugdij_legki.aspx',
      `öregségi nyugdíj legkisebb összegével')
      egyezik meg (2018-ban 28&nbsp;500 forint),
      amiből még 10% nyugdíjjárulékot levonnak'
  ),
  _HREF(`https://egbiztpenzbeli.tcs.allamkincstar.gov.hu/ell%c3%a1t%c3%a1sok/gyermekv%c3%a1llal%c3%a1s-t%c3%a1mogat%c3%a1sa/csecsem%c5%91gondoz%c3%a1si-d%c3%adj.html',`csecsemőgoondozási díj (CSED)')
  _UL(
    `jogosult, aki a szülést megelező két évben legalább 365 napot
      biztosított volt (leegyszerűsítve volt munkaviszonya). Ha ez
      nem teljesül, az illetékes Kormányhivatal megállapíthat jogosultságot.',
    `összege (leegyszerűsítve) a kereset 70%-a'
  ),
  `_HREF(`https://egbiztpenzbeli.tcs.allamkincstar.gov.hu/ell%C3%A1t%C3%A1sok/gyermekv%C3%A1llal%C3%A1s-t%C3%A1mogat%C3%A1sa/gyermekgondoz%C3%A1si-d%C3%ADj.html',`GYED (gyermekgondozási díj)'):'
  _UL(
    ``jogosult, aki a szülést megelező két évben legalább 365 napot
      biztosított volt (leegyszerűsítve volt munkaviszonya). Ha ez
      nem teljesül, az illetékes Kormányhivatal megállapíthat jogosultságot.'',
    `a munkáltatónál kell leadni az igényt',
    `összege (leegyszerűsítve) a kereset 70%-a',
    `a csecsemőgondozási díj lejártától a gyermek 2. életévének betöltéséig'
  ),
  `névválasztás esetén csak meghatározott utónevek lehetnek. A lista az
    _HREF(`http://www.nytud.mta.hu/oszt/nyelvmuvelo/utonevek/index.html',`MTA Nyelvtudományi Intézeténél') megtekinthető (kb. 1700 férfi és 2200 női név).
    A nevek szűrésére is adott _HREF(`http://corpus.nytud.hu/utonevportal/',`lehetőség'), igen sok szempont szerint.',
  `az apának születéskor a második hónap végéig öt nap pótszabadság jár (_HREF(`http://njt.hu/cgi_bin/njt_doc.cgi?docid=143164.348578',`Munka törvénykönyve'),
    118. § (4))'
)
<p>(m4_patsubst(`$Módosítva$',`\$',`'))</p>
