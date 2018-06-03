set term svg size 2560, 1440 fsize 76



set style data histogram
set style fill solid border -1
set xtic scale 0 # not sure I need that
set style histogram cluster gap 1
set yrange [0:2.5]
set y2tics
set ylabel "Vitesse (cm/s)"
set y2label "Aire (cm²) ; aire/V²(s²)"

set output "filteringByFHistograms.svg"

set yrange[0:2.5]
set y2range [0:6]
plot "filterbyFdata.csv" u 3:xtic(1) ti col, "" u 4 ti col axes x1y2, "" u 5 ti col axes x1y2


set output "filteringByMovingAverageHistograms.svg"

set y2range [0:7]
plot "movingAverageData.csv" u 3:xtic(1) ti col, "" u 4 ti col axes x1y2, "" u 5 ti col axes x1y2


set output "filteringBySpeedRedHistograms.svg"

set y2range [0:7]
plot "speedRedData.csv" u 3:xtic(1) ti col, "" u 4 ti col axes x1y2, "" u 5 ti col axes x1y2
