set term svg size 1920, 1440 fsize 66
set output "baggingRawTimes.svg"
unset key

set xrange[0:3] # Otherwise, Gnuplot goes full retard and puts the error bars right on the vertical axes
set yrange[0:14]
set ylabel "Temps moyen de sélection (s)"
set style fill solid
set boxwidth 0.25

plot "rawTimes.csv" u ($0):3:4:5:6:xticlabels(1) lw 8 with candlesticks whiskerbars,\
	"" u ($0):2:2:2:2 with candlesticks lt -1 lw 12



set output "baggingRawErrors.svg"

set ylabel "Taux d'erreurs"
set yrange[0:0.1]
plot "rawErrors.csv" u ($0):3:4:5:6:xticlabels(1) lw 8 with candlesticks whiskerbars,\
	"" u ($0):2:2:2:2 with candlesticks lt -1 lw 12



set output "baggingRawProducts.svg"

set ylabel "MTSEN"
set yrange[0:18]
plot "rawProducts.csv" u ($0):3:4:5:6:xticlabels(1) lw 8 with candlesticks whiskerbars,\
	"" u ($0):2:2:2:2 with candlesticks lt -1 lw 12



# Normalized results from here
set output "baggingNormTimes.svg"

set style fill solid
set ylabel "MTSN"
set yrange[0:0.2]
plot "normTimes.csv" u ($0):3:4:5:6:xticlabels(1) lw 8 with candlesticks whiskerbars,\
	"" u ($0):2:2:2:2 with candlesticks lt -1 lw 12



set output "baggingNormErrors.svg"

set ylabel "MTEN"
set yrange[0:0.05]
plot "normErrors.csv" u ($0):3:4:5:6:xticlabels(1) lw 8 with candlesticks whiskerbars,\
	"" u ($0):2:2:2:2 with candlesticks lt -1 lw 12



set output "baggingNormProducts.svg"

set ylabel "MTSEN"
set ytics 0.04
set yrange[0:0.24]
plot "normProducts.csv" u ($0):3:4:5:6:xticlabels(1) lw 8 with candlesticks whiskerbars,\
	"" u ($0):2:2:2:2 with candlesticks lt -1 lw 12
