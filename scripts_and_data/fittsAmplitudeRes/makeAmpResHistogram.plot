set term svg size 1920, 1440 fsize 66
set output "ampTimeRes.svg"
unset key

set xrange[0:4] # Otherwise, Gnuplot goes full retard and puts the error bars right on the vertical axes
set yrange[0:30]
set xlabel "Distance"
set ylabel "Temps moyen de sélection (s)"

set boxwidth 0.25

plot "rawTimes.csv" u ($0):2:3:4:xticlabels(1) lw 6 with yerrorbars,\
	"rawTimes.csv" u ($0):2 pt 7 ps 0.8 lc 1



set output "normTimes.svg"

set ylabel "MTSN"
set yrange[0:0.3]
plot "normTimes.csv" u ($0):2:3:4:xticlabels(1) lw 6 with yerrorbars,\
	"normTimes.csv" u ($0):2 pt 7 ps 0.8 lc 1



set output "normErrors.svg"

set ylabel "MTEN"
set yrange[0:0.3]
plot "normErrors.csv" u ($0):2:3:4:xticlabels(1) lw 6 with yerrorbars,\
	"normErrors.csv" u ($0):2 pt 7 ps 0.8 lc 1



set output "normProducts.svg"

set ylabel "MTSEN"
set yrange[0:0.4]
plot "normProducts.csv" u ($0):2:3:4:xticlabels(1) lw 6 with yerrorbars,\
	"normProducts.csv" u ($0):2 pt 7 ps 0.8 lc 1


#set output "errorRes.svg"

#set yrange[6:11]
#set ylabel "Nombre moyen d'erreurs"

#plot "errors.csv" u ($0):2:3:4:xticlabels(1) lw 6 with yerrorbars,\
#	"errors.csv" u ($0):2 pt 7 ps 0.8 lc 1

#set output "productRes.svg"
#set ylabel "Produit Temps × (Erreurs+1)"


#set style fill solid
#set yrange [0:100]
#plot "products.csv" u ($0):3:4:5:6:xticlabels(1) lw 8 with candlesticks whiskerbars,\
#	"" u ($0):2:2:2:2 with candlesticks lt -1 lw 12
