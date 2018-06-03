set term svg size 2560, 1440 fsize 76
set output "homogeneityHistogram.svg"


set style data histogram
set style fill solid border -1
set xtic scale 0 # not sure I need that
set style histogram cluster gap 1
set yrange [0:16]
set y2range [0:300]
set y2tics
set ylabel "Écarts-types des temps et des erreurs"
set y2label "Écart-type de (Temps×(Erreurs+1))"


plot "homogeneityData.csv" u 2:xtic(1) ti col, "" u 3 ti col, "" u 4 ti col axes x1y2
