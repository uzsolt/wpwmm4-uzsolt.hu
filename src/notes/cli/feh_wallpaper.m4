_LAYOUT(`note.m4',_title,`Háttér változtatása feh-hel',_subtitle,`akár cron használatával')
_INCL(`highlight.m4')
<p>A <a href=http://feh.finalrewind.org/>feh</a> program kíválóan alkalmas
arra, hogy az ablakkezelő hátterét véletlenszerűen változtassa.</p>
_highlight(`#!/bin/sh

PATH=\${PATH}:/usr/local/bin
WALLPAPER_DIR=${HOME}/wallpapers/desktop

DISPLAY=:0 feh --randomize --bg-fill \$(find ${WALLPAPER_DIR} -type f -or -type l)',sh)
<p>A fenti szkript véletlenszerűen választ a <code>${WALLPAPER_DIR}</code>
könyvtárból egy fájlt (<code>-type f</code>) vagy egy szimbolikus linket
(<code>-type l</code>). A fájlok (és linkek) listáját a <code>find</code>
adja át.</p>
<p>Ezt a szkriptet <code>crontab</code>-ban fel lehet használni, hogy
megadott időközönként a listából véletlenszerűen változtassa a
hátteret.</p>
