set term svg size 1920, 1440 fsize 66
set output "timeRes.svg"
unset key

set xrange[0:3] # Otherwise, Gnuplot goes full retard and puts the error bars right on the vertical axes
set yrange[2:3.4]
set ylabel "Temps moyen de sélection (s)"

set boxwidth 0.25

plot "times.csv" u ($0):2:3:4:xticlabels(1) lw 6 with yerrorbars,\
	"times.csv" u ($0):2 pt 7 ps 0.8 lc 1

set output "errorRes.svg"

set yrange[6:11]
set ylabel "Nombre moyen d'erreurs"

plot "errors.csv" u ($0):2:3:4:xticlabels(1) lw 6 with yerrorbars,\
	"errors.csv" u ($0):2 pt 7 ps 0.8 lc 1

set output "productRes.svg"
set ylabel "Produit Temps × (Erreurs+1)"


set style fill solid
set yrange [0:100]
plot "products.csv" u ($0):3:4:5:6:xticlabels(1) lw 8 with candlesticks whiskerbars,\
	"" u ($0):2:2:2:2 with candlesticks lt -1 lw 12
