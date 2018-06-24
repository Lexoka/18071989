set term svg size 2560, 1440 fsize 76
set output "distHisto.svg"


set style data histogram
set style fill solid border -1
#set xtic scale 0 # not sure I need that
set style histogram cluster gap 1
set xrange[-1:2]
set yrange [0:14000]
set ylabel "Distance (pixels)"


plot "average_stats.csv" u 2:xticlabels(1) ti col



set output "speedHisto.svg"
set yrange [0:7000]
set ylabel "Vitesse maximale (Pixels/s)"
set y2label "Vitess moyenne (Pixels/s)"
set y2range[0:1200]
set y2tics

plot "average_stats.csv" u 3:xticlabels(1) ti col, "" u 4 ti col axes x1y2

set output "accelHisto.svg"
set yrange [0:300]
set y2range[0:30]
set ylabel "Accélération maximale (kPixels/s²)"
set y2label "Accélération moyenne (kPixels/s²)"
plot "average_stats.csv" u (($5)/1000):xticlabels(1) ti col, "" u (($6)/1000) ti col axes x1y2



set output "jerkHisto.svg"
set yrange [0:40]
set y2range [0:3]
set ylabel "À-coup maximal (MPixels/s^{3})"
set y2label "À-coup moyen (MPixels/s^{3})"
plot "average_stats.csv" u (($7)/1000000):xticlabels(1) ti col, "" u (($8)/1000000) ti col axes x1y2




#set output "normHomogeneityHistogram.svg"

#unset y2tics
#unset y2label
#set ylabel "Écarts-types"
#set yrange [0:0.3]


#plot "normHomogeneityData.csv" u 2:xtic(1) ti col, "" u 3 ti col, "" u 4 ti col
