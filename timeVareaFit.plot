set term png size 2560, 1440 font arial 38

set xlabel "Aire/V"
set ylabel "Temps de sélection moyen normalisé/V"

set output "timeVareaFit.png"

f(x) = x-1
sigma = 3

set xrange [1:11]

plot "explo.csv" u 1:2 ps 4 lw 4 title "Données, 1,46 et 2,19 cm/s",\
	2.65*(f(x)/sigma**2)*exp( (-f(x)*f(x))/(2*sigma**2) ) + 0.15 lw 4 notitle
