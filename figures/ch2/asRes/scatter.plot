set terminal svg size 2560,1440 fname 'Verdana' fsize 72
set output 'asRes.svg'

set style fill solid 1.0 border
unset key

set xlabel "Taux d'erreurs (%)"
set ylabel "Temps de sélection moyen (s)"
set xrange [0:44]
set yrange [1.2:2]
plot "asRes.data" using 2:3 with circles lc "red", \
	"" using 2:3:1 with labels offset 0, char -1
