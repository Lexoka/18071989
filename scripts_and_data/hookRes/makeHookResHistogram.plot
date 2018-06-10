set term svg size 1920, 1440 fsize 66
set output "hookRawTimes.svg"
unset key

set xrange[0:3] # Otherwise, Gnuplot goes full retard and puts the error bars right on the vertical axes
set yrange[0:2.5]
set ylabel "Temps moyen de sélection (s)"

set boxwidth 0.25

plot "rawTimes.csv" u ($0):2:3:4:xticlabels(1) lw 6 with yerrorbars,\
	"rawTimes.csv" u ($0):2 pt 7 ps 0.8 lc 1



set output "hookRawErrors.svg"

set ylabel "Taux d'erreurs"
set yrange[0:0.4]
plot "rawErrors.csv" u ($0):2:3:4:xticlabels(1) lw 6 with yerrorbars,\
	"rawErrors.csv" u ($0):2 pt 7 ps 0.8 lc 1



set output "hookRawProducts.svg"

set ylabel "Temps×(Erreurs+1)"
set yrange[0:3.5]
plot "rawProducts.csv" u ($0):2:3:4:xticlabels(1) lw 6 with yerrorbars,\
	"rawProducts.csv" u ($0):2 pt 7 ps 0.8 lc 1



# Normalized results from here
set output "hookNormTimes.svg"

set style fill solid
set ylabel "MTSN"
set yrange[0.16:0.22]
plot "normTimes.csv" u ($0):3:4:5:6:xticlabels(1) lw 8 with candlesticks whiskerbars,\
	"" u ($0):2:2:2:2 with candlesticks lt -1 lw 12



set output "hookNormErrors.svg"

set ylabel "MTEN"
set yrange[0.02:0.05]
plot "normErrors.csv" u ($0):3:4:5:6:xticlabels(1) lw 8 with candlesticks whiskerbars,\
	"" u ($0):2:2:2:2 with candlesticks lt -1 lw 12



set output "hookNormProducts.svg"

set ylabel "MTSEN"
set yrange[0.18:0.24]
plot "normProducts.csv" u ($0):3:4:5:6:xticlabels(1) lw 8 with candlesticks whiskerbars,\
	"" u ($0):2:2:2:2 with candlesticks lt -1 lw 12
