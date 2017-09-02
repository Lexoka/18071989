set term png size 2560, 1440 font arial 38
set output "asqrtf2area.png"

set ylabel "Aire"
unset key

plot "areasFromAF.csv" u (sqrt($1)*$2):4 ps 1 lw 6

set output "af2area.png"
plot "areasFromAF.csv" u ($1*$2):4 ps 1 lw 6
