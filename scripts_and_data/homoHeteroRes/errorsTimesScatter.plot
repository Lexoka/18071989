set terminal svg size 1920,1440 fname 'Verdana' fsize 66
set output 'errorsTimesScatter.svg'

set style fill solid 1.0 border
unset key

#set lmargin 6
#set rmargin 0
#set tmargin 0.4
#set bmargin 2.5

set xlabel "Nombre moyen d'erreurs"
set ylabel "Temps de sélection moyen (s)"


set xrange [9:10]
set yrange [2.8:3.2]


plot "errorsTimesData.csv" using 2:3 with points pt 7 ps 2 lc "red",\
	"" using 2:3:1 with labels offset 0, char 1
