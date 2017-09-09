set term svg size 2560, 1440 fsize 42
set output "asqrtf2area.svg"

set ylabel "Aire (cm²)"
unset key

plot "areasFromAF.csv" u (sqrt($1)*$2):4

set output "af2area.svg"
plot "areasFromAF.csv" u ($1*$2):4

set logscale x
set logscale y
set xrange [0.2:13000]
set yrange [0.1:11]
set output "af2areaLogLog.svg"
plot "areasFromAF.csv" u (sqrt($1)*$2):4
