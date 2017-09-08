set term svg size 2560, 1440 fsize 42
set output "asqrtf2area.svg"

set ylabel "Aire"
unset key

plot "areasFromAF.csv" u (sqrt($1)*$2):4 ps 1 lw 6

set output "af2area.png"
plot "areasFromAF.csv" u ($1*$2):4 ps 1 lw 6
