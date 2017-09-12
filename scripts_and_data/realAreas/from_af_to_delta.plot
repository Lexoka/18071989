set term svg size 2560, 1440 fsize 46
set output "a_rootF_delta.svg"

set ylabel "Delta"
unset key

set logscale x
set logscale y
set xrange [0.2:13000]
set yrange [0.001:4]

plot "quadApproxSorted.csv" u 4:5
