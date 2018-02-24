_LAYOUT(`note.m4',_title,`Adóbevallás',_subtitle,`Egyéni vállalkozó (36 óra mellett) adóbevallása')
m4_define(`_sor',`<em>'$1`</em><sup>'$2`</sup>')
<p>Néhány sorban igyekszem összeszedni, hogy egy egyéni vállakozó adóbevallásában
(ha saját maga készíti) mire figyeljen, hogyan jönnek ki a bűvös számok.</p>
<p>2018-tól már egyéni vállalkozók is készíthetik bevallásukat az _HREF(`https://eszja.nav.gov.hu/',`eSZJA')
segítségével. Véleményem szerint sokkal barátságosabb, áttekinthetőbb, mint az
_HREF(`https://www.nav.gov.hu/nav/ebevallas/abevjava',`ÁNYK') program. A szövegben szereplő sorok hivatkozásai
is az <em>eSZJA</em>-ban található sorhivatkozások.</p>
<ol>
<li>
  <p>A <em>nyereség</em> összege a _sor(`bevétel',`EV-21') csökkentve a
  _sor(`kiadás',`EV-49, EV-54')-sal
  és az esetlegesen előző évekről áthozott
  _sor(`veszteség',`EV-62') összegével:</p>
  <div class="center">nyereség = bevétel &minus; (kiadás+veszteség)</div>
  <p>Az eredmény a _sor(`Módosított vállalkozói adóalap',`EV-65') sorban jelenik meg.</p>
</li>
<li>
  <p>Az automatikusan számolt _sor(`Vállalkozói személyi jövedelemadó módosított összege',`EV-75')
  összege a <em>nyereség</em> 9&percnt;-a:</p>
  <div class="center">VSZJA = nyereség&times;0,09</div>
</li>
<li>
  <p>A nyereséget csökkentjük ezzel az értékkel, majd ennek a csökkentett értéknek a 15&percnt;-a fizetendő még
  személyi jövedelemadóként, illetve 14&percnt;-át <em>egészségügyi hozzájárulásként</em>, amelyet az
  _sor(`A magánszemély 14%-os hozzájárulása',`290') sorba a <em>További kötelezettség</em> rovatba írunk be.</p>
</li>
<li>
  <p>Ha maradt még veszteség, akkor ne felejtsük a _sor(`A korábbi évekről áthozott, még el nem számolt elhatárolt veszteség összege',`EV-82')
  sorba beírni!</p>
</li>
</ol>
<p>(m4_patsubst(`$Date$',`\$',`'))</p>
