set term svg size 2560, 1440 fsize 76
set output "asqrtFvTime.svg"

set ylabel "MTSN/V"
set xlabel "A√F"
unset key

plot "exploAF.csv" u 9:11 ps 1 pt 7 lc 1 lw 3
