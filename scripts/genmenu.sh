#!/bin/sh

IFS="|"
FILE=data/menu.psv
STR_HOMEPAGE="Kezdőlap"

print_menu() {

  local level=${1:-0} ; shift
  local current=${1:-""} ; shift
  # level+2: the first character is /
  local next_level=`echo ${current} | cut -d / -f -$((level+2))`

  if [ ${level} -eq 0 ]; then
    local pattern='^http://\|^/[^/]*/|'
  else
    local current_level=`echo ${current} | cut -d / -f -$((level+1))`
    local pattern="${current_level}/[^/]*/|"
  fi

  local indentstr=`jot -b ' ' -s '' $((level*2+2))`
  if [ "${level}" -gt 0 ]; then
    if grep -q "^${next_level}/" ${FILE}; then
      printf '%s<div class="div_submenu">\n' "${indentstr}"
    fi
  fi
  grep "${pattern}" ${FILE} | \
    while read href title tooltip; do
      if echo ${href} | grep -q "^${next_level}/$"; then
        local divclass=selected
      else
        if [ "${level}" -eq 0 ]; then
          local divclass=menu
        else
          local divclass=submenu
        fi
      fi
      printf "%s_DIV(%s,\n" "${indentstr}" ${divclass}
      printf "  %s\`_HREF(\`%s\',\`%s\',\`class=menu_href',\`%s\')" "${indentstr}" "${href}" "${title}" "${tooltip}"
      if echo ${href} | grep -q "^${next_level}/$"; then
        print_menu $((level+1)) ${current}
      fi
      printf "'\n%s)\n" "${indentstr}"
    done
  if [ "${level}" -gt 0 ]; then
    if grep -q "^${next_level}/" ${FILE}; then
      printf "%s</div>\n" "${indentstr}"
    fi
  fi
}

# kilistázza a gyökérben levő pontokat (0. szint)
# közben megtalálja a belépési pontot a következő szintre
#   grep-pel az előző szintre
#   közben megtalálja a belépési pontot a következő szintre...
cat << EOF
<div id=menu>
  <a href=http://uzsolt.hu>
  <div id=menu_header><h2>Udvari Zsolt honlapja</h2></div>
  </a>
  <div class=div_menu>
EOF

print_menu 0 $*
cat << EOF
  </div>
</div>
EOF
if [ "${1}" = "/" ]; then
  ACTIVE_MENU="${STR_HOMEPAGE}"
else
  ACTIVE_MENU=`grep "$1|" ${FILE} | awk -F '|' '{print $2}'`
fi
echo "m4_define(_ACTIVEMENU,\`${ACTIVE_MENU}')"

