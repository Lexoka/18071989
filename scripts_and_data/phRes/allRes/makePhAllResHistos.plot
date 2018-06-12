set term svg size 1920, 1440 fsize 66
set output "phRawTimes.svg"
unset key

set xrange[0:3] # Otherwise, Gnuplot goes full retard and puts the error bars right on the vertical axes
set yrange[0:16]
set ylabel "Temps moyen de sélection (s)"

set boxwidth 0.25

plot "rawTimes.csv" u ($0):2:3:4:xticlabels(1) lw 6 with yerrorbars,\
	"rawTimes.csv" u ($0):2 pt 7 ps 0.8 lc 1



set output "phRawErrors.svg"

set ylabel "Taux d'erreurs"
set yrange[0:0.1]
plot "rawErrors.csv" u ($0):2:3:4:xticlabels(1) lw 6 with yerrorbars,\
	"rawErrors.csv" u ($0):2 pt 7 ps 0.8 lc 1



set output "phRawProducts.svg"

set ylabel "Temps×(Erreurs+1)"
set yrange[0:25]
plot "rawProducts.csv" u ($0):2:3:4:xticlabels(1) lw 6 with yerrorbars,\
	"rawProducts.csv" u ($0):2 pt 7 ps 0.8 lc 1



# Normalized results from here
set output "phNormTimes.svg"

set style fill solid
set ylabel "MTSN"
set yrange[0:0.18]
plot "normTimes.csv" u ($0):2:3:4:xticlabels(1) lw 6 with yerrorbars,\
	"" u ($0):2 pt 7 ps 0.8 lc 1



set output "phNormErrors.svg"

set ylabel "MTEN"
set yrange[0:0.04]
plot "normErrors.csv" u ($0):2:3:4:xticlabels(1) lw 6 with yerrorbars,\
	"" u ($0):2 pt 7 ps 0.8 lc 1



set output "phNormProducts.svg"

set ylabel "MTSEN"
set yrange[0:0.2]
plot "normProducts.csv" u ($0):2:3:4:xticlabels(1) lw 6 with yerrorbars,\
	"" u ($0):2 pt 7 ps 0.8 lc 1
