set terminal svg size 1920,1440 fname 'Verdana' fsize 66
set output "rawHookErrorsTimesScatter.svg"

set style fill solid 1.0 border
unset key

set xlabel "Nombre moyen d'erreurs"
set ylabel "Temps moyen de sélection (s)"

#set xtics 0.04
set xrange [0:0.36]
set yrange [0:2.5]

plot "rawErrorsTimesData.csv" using 2:3 with points pt 7 ps 2 lc "red",\
	"" using 2:3:1 with labels offset 0, char 1



set output "normHookErrorsTimesScatter.svg"

set xrange [0:0.05]
set yrange [0:0.25]

plot "normErrorsTimesData.csv" using 2:3 with points pt 7 ps 2 lc "red",\
	"" using 2:3:1 with labels offset 0, char 1
