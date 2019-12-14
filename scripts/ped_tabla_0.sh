#!/bin/sh

ilalapk=$1
ilalapb=$2
ilalapm=$3

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
    $(($2*ilalapk/100))\
    $(($2*ilalapb/100))\
    $(($2*ilalapm/100))\
    "$3" \
    $(($3*ilalapk/100))\
    $(($3*ilalapb/100))\
    $(($3*ilalapm/100))
}

potleksor "intézményvezetői" "40" "80"
potleksor "osztályfőnöki (koll. csop.vez.)" "10" "30"
potleksor "munkaközösség-vezetői" "5" "10"
potleksor "intézményvezető-helyettesi" "20" "40"
potleksor "nemzetiségi" "10" "40"
potleksor "gyógypedagógiai" "5" "10"
potleksor "nehéz körülmények között</br>végzett munkáért" "10" "30"
potleksor "gyakorlati oktatás-vezetői" "20" "40"
