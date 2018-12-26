#!/bin/sh

# Paraméterek:
# 1-2 Ped I. min. kat, min. százalék
# 3-4 Ped II. min. kat, min. százalék
# 5-6 MP min. kat., min. százalék
# 7-8 KT min. kat., min. százalék
# 9   max. év
# 10  középfokú illetményalap
# 11  BSc illetményalap
# 12  MSc illetményalap

pedakat=$1
pedasz=$2
pedbkat=$3
pedbsz=$4
pedckat=$5
pedcsz=$6
peddkat=$7
peddsz=$8
maxev=$9
shift 9
illalapk=$1
illalapb=$2
illalapm=$3


# $1 - minkat
# $2 - minsz
# $3 - kat
getsz() {
  if [ $3 -ge $1 ]; then
    echo $(($2+($3-$1)*5))
  else
    echo
  fi
}

# $1 - kat
getasz() {
  ret=$(getsz 2 120 $1)
  [ $1 -gt 2 ] && ret=$((ret+5))
  echo ${ret}
}

# $1 - szazalek
getsubtable() {
  local PERCENT=$1
  if [ -n "${PERCENT}" ]; then
    local PARA="$((illalapk*PERCENT/100))"
    local PARB="$((illalapb*PERCENT/100))"
    local PARC="$((illalapm*PERCENT/100))"
    printf "
      <table>
        <tr><td class='percent'>%s%%</td></tr>
        <tr><td>%'d Ft</td></tr>
        <tr><td>%'d Ft</td></tr>
        <tr><td>%'d Ft</td></tr>
      </table>
    " "${PERCENT}" "${PARA}" "${PARB}" "${PARC}"
  else
    printf "\n"
  fi
}

kat=2
ev=3
while [ "${ev}" -lt "${maxev}" ]; do
  printf '
  <tr>
    <td>%s.</td><td>%s-%s</td>
    <td>
      %s
    </td>
    <td>
      %s
    </td>
    <td>
      %s
    </td>
    <td>
      %s
    </td>
  </tr>\n' \
    "${kat}" "${ev}" "$((ev+2))" \
    "$(getsubtable $(getasz ${kat}))" \
    "$(getsubtable $(getsz ${pedbkat} ${pedbsz} ${kat}))" \
    "$(getsubtable $(getsz ${pedckat} ${pedcsz} ${kat}))" \
    "$(getsubtable $(getsz ${peddkat} ${peddsz} ${kat}))"

  kat=$((kat+1))
  ev=$((ev+3))

done
