_LAYOUT(`note.m4',_title,``Webhelyek gyorsasága'',_subtitle,``Mitől lesz egy honlap megjelenítése gyors?'')
<h3>Frontend optimalizálás</h3>

<p>A frontendet talán a legegyszerűbb optimalizálni, mivel kevés egyéb függősége
van. Ebben a tekintetben érdemes megnézni - a már kissé koros, de továbbra is
érvényes - <a href=https://developer.yahoo.com/performance/rules.html>írást a
    Yahootól</a>.</p>

<p>Mint ahogy a Yahoo is írja, sokkal fontosabb a lekérések számának csökkentése,
mint a méretcsökkentés, hiszen mobilinterneten sokszor rendelkezésre áll kellő
sávszélesség, azonban a késleltetés elérhet akár egy másodpercet is. Egy egy
másodperces késleltetés esetén egy oldal betöltés hosszú tíz másodpercekbe is
telhet.</p>
<p>Ezt érzékelteti az index.hu főoldalának betöltése a
<a href=https://gtmetrix.com/>GTMetrix</a> kanadai szerveréről.</p>

<h4>SASS/SCSS</h4>

<p>A <a href=http://sass-lang.com/>SASS vagy SCSS</a> 
(kinek melyik szintaxis tetszik jobban) egy olyan nyelv, amit
egy fordító CSS-é alakít át. Amellett, hogy kellemes funkciókat ad hozzá a
nyelvhez, mint például változók, az az előnye is megvan, hogy az összes
forrásfájlt egyetlen CSS fájlba tömöríti.</p>

<h4>JavaScript optimalizálás</h4>

<p>A CSS mintájára természetesen a JavaScript modulokat is kezelhetjük Bowerrel, és
tömöríthetjük például uglify.js-el. Ez azonban önmagában nem a gyors weboldal
titka.</p>

<p>Egy ügyféloldal optimalizálása során vettem észre, hogy a külső szolgáltatók
által biztosított embed kódok (pl. Twitter box, stb) nem feltétlenül
optimálisak. Egy-egy ilyen embed code szerencsétlen esetben egy-két másodpercet
is rátehet az oldal betöltődésre. Ugyan a felhasználó már olvashatna, de látja,
hogy a böngésző még <q>teker</q>. Ez azért problémás, mert a felhasználók megszokták,
hogy az oldal betöltése után még történik valami, pl. megjelenik a cookie policy
bar, ami mozgatja a tartalmat, megszakítva a folyamatot.</p>

<p>Éppen ezért a JavaScript optimalizálásnak három nyitja van:
<ol>
    <li>Amikor csak lehet, a külső forrásból származó információkat a háttérben
        kell lekérni és lehetőség szerint rögtön az oldal forrásába beépíteni.
        Ha például egy Twitter feedet kérünk le, akkor a szerver oldali API-t
        használva frissítsük 15 percenként, ne hagyatkozzunk a Twitter
        JavaScript kódjára. (Ez megment minket az EU által megkövetelt cookie
        policy bonyolódásától is.)</li>
    <li>Ha már valamilyen embed kódot használunk, nézzük meg, nem ágyazható-e be
        közvetlenül, tömörítve a saját JavaScript kódunkba. Én így tettem
        például a Piwik tracking kóddal, ami megkímélte a böngészőket egy
        fölösleges requesttől az oldal betöltődése után. Ezt a problémát még
        súlyosbítja, amikor az "embed kód" semmi mást nem csinál, csak beszúr
        egy script taget. Erre sokszor semmi szükség, nézzük meg, nem tudjuk-e
        helyettesíteni egy saját, optimálisabb kóddal! (Emlékeztetőül: a
        szolgáltatók által biztosított kód célja az, hogy a lehető legtöbb
        helyzetben működjön, ezért hajlandóak beáldozni némi
        teljesítményt.)</li>
    <li>Ügyeljünk a CPU használatra! Természetes, hogy a fejlesztői gépünkben
        kellő mennyiségű RAM és CPU van, de vagy próbáljuk ki az oldalunkat egy
        két generációval ezelőtti gagyi mobiltelefonon, vagy legyünk észnél a
        JavaScript kódok írásánál.</li>
</ol></p>

<h4>Képek optimalizálása</h4>
<p>Remélhetőleg ma már mindenki hallot a CSS sprite-okról, ahol több képet
összecsomagolunk egybe és CSS-el pozicionáljuk a háttérbe, ezzel megtakarítva
több tucatnyi requestet. Erről a technikáról nem is szeretnék beszélni.</p>
<p>Egy másikról viszont igen. Ma már szerencsére minden böngésző támogatja a
<a href=https://en.wikipedia.org/wiki/Data_URI_scheme>data uri</a>-kat.
Ennek segítségével magába a CSS-be ágyazható be kép anélkül, hogy ez
bármilyen hátránnyal járna (feltételezve, hogy a kép kellően kicsi). Én így
tettem a háttérképpel, hiszen mindenképpen szükség van rá, teljesen fölösleges
külön elküldeni. Itt mindig mérlegelni kell, hogy az adott képre tényleg szükség
van-e, vagy esetleg mégis csak előnyösebb külön tartani.</p>
<p>Ha már a képeknél tartunk, érdemes megfontolni, hogy az adott háttérkép nem
cserélhető-e le egy CSS3 effekttel. Néhány böngészőben ugyan nem fog megjelenni,
de egy árnyékolás hiánya nagyon sok esetben még nem rontja számottevően a
böngészési élményt, azonban rengeteg fölösleges lekérdezéstől menthet meg
minket.</p>
<p>Megjelenítendő egyéb kép optimalizálása: az 
<a href=http://www.imagemagick.org/script/index.php>ImageMagick</a>
programcsomag <a href=http://www.imagemagick.org/script/convert.php>convert</a>
parancsa képes elvégezni: <code>convert -strip input.jpg output.jpg</code>.
Ezzel jelentős méretcsökkenést érhetünk el.</p>
<p>Képek listázásakor (albumok, bélyegképek) érdemes a kép méretét megadni, 
így a böngésző nem fogja újrarajzolni az egész oldalt, amikor a kép 
betöltődött, és már tudható a kép mérete. Ekkor a 
<code>convert -resize 64x64^ -gravity center -extent 64x64 input.jpg output.jpg</code> 
parancs lehet hasznos. Ezzel egy 64x64-es bélyegképet
készíthetünk, nem megfelelő arányú eredeti kép esetén széleket fog levágni 
(részletes magyarázat <a href=http://www.imagemagick.org/script/convert.php>itt</a>).</p>

<h4>Óvatosan a CDN-nel</h4>
<p>Nagyon sok eszköz azt fogja javasolni, hogy a statikus tartalmainkat tartsuk
CDN-en. Ez azonban kisebb oldalak esetén, különösen Magyarországon, nem
feltétlenül előnyös.</p>
<p>Ennek két oka van. Az első a CDN-ek működéséből adódik. Ha egy erőforrást sokáig
nem kértek le, a CDN eldobja azt, es igény esetén újra kéri az "origin"
szervertől. Ez természetesen időbe telik, ami nálam egy laza másodpercet dobott
az oldal betöltési idejére. Valamennyire ez néhány szolgáltatónál
kiküszöbölhető, de látni fogjuk, hogy ennek ellenére semmi értelme.</p>
<p>A másik ok Magyarország speciális helyzete. Nagyon sok oldal csak és kizárólag
lokális piacra készül, tehát Magyarországra. Magyarországon az internet
felépítése olyan, hogy a Budapest Internet Exchangen keresztük a szolgáltatók
ingyenesen cserélhetnek ki adatot egymással, ezért a magyarországi forgalom
hagyományosan nagyon olcsó. A nemzetközi forgalom viszont ezzel szemben nagyon
drága, ezért a szolgáltatók többsége csak nagyon kevés kapacitást vesz ebbe az
irányba. Namost, a CDN szolgáltatók közül (tudtommal) nagyon kevésnek vagy
egyiknek sincs közvetlen lába a BIX-en, ezért egy igen érdekes helyzet állhat
elő. Ha példának okáért egy vidéki szolgáltató éppen ezen a ponton spórolt,
könnyen lehet, hogy az oldalunk statikus tartalmai a délután csúcsforgalomban
ácsorognak, ahelyett hogy a BIX-en keresztül gyorsan betöltődne.</p>

<h4>Használjuk az eszközöket!</h4>
<p>Ma már rengeteg eszköz áll a rendelkezésünkre a frontend teljesítmény
növelésére, ilyen például a
<a href=https://developers.google.com/speed/pagespeed/?hl=en>PageSpeed</a> 
vagy az <a href=http://yslow.org/>Yslow</a>. Használjuk őket!</p>

<h3>Backend optimalizálás</h3>
<p>A backend kétség kívül a munkaigényesebb optimalizálási folyamat, azonban itt
sem minden feltétlenül nehéz. Sajnos a jó teljesítmény mellé sokszor az is
társul, hogy nem fogunk mentesülni az alól, hogy saját fizikai vasat vegyünk
vagy béreljünk és megfizessük az ehhez értő rendszergazdát.</p>

<h4>A helyes webszerver választás</h4>
<p>Ha Linux/UNIX platformon mozgunk, hagyományosan Apache HTTPd fut a
szolgáltatásaink alatt. Ez a webszerver azonban amellett, hogy igen csak koros,
küzd egy csomo problémával, például régről megmaradt funkciókkal, amik rontják a
teljesítményt, de nem lehet megszabadulni tőle, mert akkor kaszás lázadás
lesz.</p>
<p>Éppen ezért érdemes az olyan webszerverek irányába nézelődni, amik eleve arra a
feladatra készültek, hogy több tízezer párhuzamos kapcsolatot szolgáljanak ki és
a lehető leghatékonyabban lapátolják a biteket a merevlemezről. Az egyik ilyen
szerver az <a href=http://nginx.org/>nginx</a>.</p>
<p>Mondanom sem kell, hogy a csupaszításnak áldozatul esik néhány kényelmi funkció
is. Az egyik ilyen a .htaccess támogatás (ami borzasztó hátrányos a
teljesítményre nézve), valamint a közvetlen PHP integráció is. Ez utóbbi helyett
kénytelenek leszünk PHP-FPM-et használni.</p>

<h4>A PHP szindróma</h4>
<p>A PHP egy igen hasznos eszköz és személy szerint a kedvenc nyelvem webes
feladatokra. Egy komoly gonddal azonban küzd: hogy minden lekérdezésre újra és
újra le kell futtatni az összes programkódot. Ez természetesen időbe kerül, így
nem nagyon látunk olyan komoly weboldalt, ami 300 ms-nél kevesebb idő alatt
tudná teljesíteni az első requestet. A probléma sajnos sokkal súlyosabb lett a
modern PHP frameworkök megjelenésével, amik megpróbálnak egy általánosított
megoldást nyújtani a teljesítmény rovására.</p>
<p>Ezzel szemben a jól megírt Java vagy Python motoroknak optimális esetben csak
elő kell kapniuk a memóriában levő, már legenerált változatot, és ki kell
tolniuk a kimenetre.</p>
<p>Szerencsére PHP-val erre van megoldás. Ha úgy tetszik, a statikusan
kiszolgálható tartalmakat előre kigenerálhatjuk egy könyvtárba .html
kiterjesztéssel, és rávehetjük a webszervert, hogy ha létezik, ezt a változatot
szolgálja ki. Ennek a tovább fejlesztett változata az olyan statikus oldal
generátorok, mint például a <a href=https://jekyllrb.com/>Jekyll</a> vagy 
a <a href=https://sculpin.io/>Sculpin.io</a>.</p>
<p>Ezek a megoldások természetesen mind feltételezik, hogy nincs olyan üzleti
igényünk, ami minden oldal lekérdezéskor változást kíván meg.</p>

<h4>Mérés</h4>
<p>Sokszor sajnos hiába mondom: ha optimalizálunk, mérni, mérni, mérni. Rengetegen
teljesen téves úton indulnak el, amikor megpróbálnak egy látszólag lassú
funkciót vérverejtékkel optimalizálni, amikor egy másik funkciót, ami ugyan
gyors, de több ezerszer fut le, sokkal könnyebb lenne.</p>
<p>Ha programkódról van szó, akkor ezt a feladatot látják el a Cachegrind eszközök,
amig megmutatják, hogy miből mennyi futott és mennyi időbe telt.</p>

<h3>Zárszó</h3>
<p>Nehéz tanácsot adni optimalizálás témakörében, mert sokszor az üzleti igények
felül írják az ilyen irányú igyekezetet, azonban néha van olyan helyzet, amikor
meg lehet győzni a döntéshozót, hogy nem kell oda az a funkció.</p>
<p>Amikor pedig optimalizálni kell, ismerjük meg az eszközeinket: nézzük meg, mit
árul el a böngésző, próbáljuk ki mobilneten az oldalunkat, esetleg szándékosan
lassítsuk le a kapcsolatot. Így sokkal nyilvánvalóbb lesz, hogy hol vannak a
szűk keresztmetszetek.</p>
<p>Tapasztalatom szerint az emberek a következők teljesülése esetén éreznek
<q>gyorsnak</q> egy oldalt:</p>
<ul>
    <li>Az oldal betöltése még a Föld túloldaláról / nagy késleltetésű
        mobilneten sem tart tovább 2-3 másodpercnél</li>
    <li>Az oldal első betöltése nem igényel 500kB-1MB-nál több
        sávszélességet.</li>
    <li>Az oldal még egy gyenge gépen sem pörgeti fel a ventillátort /
        forrósítja fel a készüléket. Még akkor sem, ha az oldalt 6-8 óráig
        nyitva hagyjuk.</li>
</ul>

<center><a href=https://www.veremcsere.hu/53/mitol-lesz-gyors-egy-weboldal-megjelenesi-sebessege>(alap forrás, Pásztor János)</a></center>
<center><a href=https://creativecommons.org/licenses/by-nc-sa/3.0/>Creative Commons Attribution NonCommercial ShareAlike 3.0 licenc</a></center>
