#!/bin/sh

export ilalapk="${1}"
export ilalapb="${2}"
export ilalapm="${3}"

# $1 - elnevezés
# $2 - minimum százalék
# $3 - maximum százalék
potleksor() {
  printf "<tr>
    <td>%s</td>
    <td><table>
      <tr><td class='percent'>%s%%</td></tr>
      <tr><td>%'d Ft</td></tr>
      <tr><td>%'d Ft</td></tr>
      <tr><td>%'d Ft</td></tr>
    </table></td>
    <td><table>
      <tr><td class='percent'>%s%%</td></tr>
      <tr><td>%'d Ft</td></tr>
      <tr><td>%'d Ft</td></tr>
      <tr><td>%'d Ft</td></tr>
    </table></td>
  </tr>" "$1" \
    "$2" \
    "$(bc -e "${2}*${ilalapk}/100" -e "quit")" \
    "$(bc -e "${2}*${ilalapb}/100" -e "quit")" \
    "$(bc -e "${2}*${ilalapm}/100" -e "quit")" \
    "$3" \
    "$(bc -e "${3}*${ilalapk}/100" -e "quit")" \
    "$(bc -e "${3}*${ilalapb}/100" -e "quit")" \
    "$(bc -e "${3}*${ilalapm}/100" -e "quit")"
}

potleksor "intézményvezetői" "40" "80"
potleksor "osztályfőnöki (koll. csop.vez.)" "10" "30"
potleksor "munkaközösség-vezetői" "5" "10"
potleksor "intézményvezető-helyettesi" "20" "40"
potleksor "nemzetiségi" "10" "40"
potleksor "gyógypedagógiai" "5" "10"
potleksor "nehéz körülmények között</br>végzett munkáért" "10" "30"
potleksor "gyakorlati oktatás-vezetői" "20" "40"
