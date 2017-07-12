_LAYOUT(`note.m4',_title,`VMware vSphere Client FreeBSD-n',_subtitle,`Telepítése, használata')
_INCL(`highlight.m4')
<p>Sajnos a vSphere Client-ből csak Windows-ra van verzió. Viszont a
<a href=https://www.winehq.org/>Wine</a> segítségével némi trükközéssel több-kevesebb
kompromisszummal működésre lehet bírni.</p>
<p>A <code>wine VMware-viclient-all-...exe</code> parancs végeredménye az, hogy a <em>hcmon</em>
driver-t nem tudta telepíteni, és a telepítés nem történt meg.</p>
A megoldás lépései:
<ol>
<li><code>wine VMware-viclient-all-...exe</code> parancs futtatása</li>
<li>a végén a <em>hcmon</em>-hibát nyugtázni, de a <em>Finish</em>-re <b>nem</b> kattintani</li>
<li><code>mv ~/.wine ~/.wine-temp</code></li>
<li>rákattintani a <em>Finish</em>-re</li>
<li><code>mv ~/.wine-temp ~/.wine</code></li>
<li><code>winetricks -q msxml3 dotnet35sp1 vcrun2005 vcrun2008 vcrun2010</code></li>
<li>ezután <code>wine ~/.wine/drive_c/Program\ Files/VMware/Infrastructure/Virtual\ Infrastructure\ Client/Launcher/VpxClient.exe</code> :)</li>
</ol>

Forrás: <a href=https://appdb.winehq.org/objectManager.php?sClass=version&iId=30036>appdb kommentjében</a>.
