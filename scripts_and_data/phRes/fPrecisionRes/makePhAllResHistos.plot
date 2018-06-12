set term svg size 1920, 1440 fsize 66
set output "phPrRawTimes.svg"
unset key

set xrange[0:3] # Otherwise, Gnuplot goes full retard and puts the error bars right on the vertical axes
set yrange[0:16]
set ylabel "Temps moyen de sélection (s)"
set style fill solid
set boxwidth 0.25

plot "rawTimes.csv" u ($0):3:4:5:6:xticlabels(1) lw 8 with candlesticks whiskerbars,\
	"" u ($0):2:2:2:2 with candlesticks lt -1 lw 12


# Normalized results from here
set output "phPrNormTimes.svg"

set style fill solid
set ylabel "MTSN"
set yrange[0:0.3]
plot "normTimes.csv" u ($0):3:4:5:6:xticlabels(1) lw 8 with candlesticks whiskerbars,\
	"" u ($0):2:2:2:2 with candlesticks lt -1 lw 12
