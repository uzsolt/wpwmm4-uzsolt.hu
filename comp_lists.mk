COMP_LISTS= \
	comp/math/aranyd \
	comp/math/bolyai \
	comp/math/imolya \
	comp/math/kalmar \
	comp/math/nemzetkozi \
	comp/math/nlg \
	comp/math/oktv \
	comp/math/szfvi \
	comp/phys/borpal \
	comp/phys/budo \
	comp/phys/mikola \
	comp/phys/tornyai

.for C in ${COMP_LISTS}
CTANEV_${C}!=cut -d , -f 1 data/${C}.csv | sort -u
CEVF_${C}!=cut -d , -f 2 data/${C}.csv | sort -u
.endfor
