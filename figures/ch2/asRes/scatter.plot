set terminal svg size 2560,1440 fname 'Verdana' fsize 76
set output 'asRes.svg'

set style fill solid 1.0 border
unset key

set lmargin 6
set rmargin 0
set tmargin 0.4
set bmargin 2.5

#set xlabel "Taux d'erreurs (%)"
#set ylabel "Temps de sélection moyen (s)"

set label "Temps de sélection moyen (s)" rotate by 90 at first 0, graph 0 offset char -5, char -1
set label "Taux d'erreurs (%)" at first 0, graph 0 offset char 12, char -1.8

set xrange [0:44]
set yrange [1.2:2]
plot "asRes.data" using 2:3 with circles lc "red", \
	"" using 2:3:1 with labels offset 0, char -1
