set term png size 2560, 1440 font arial 36
set output "afRealDelta_log.png"
set xlabel "Angle"
set ylabel "Fréquence"
unset key

set pm3d map
set pm3d interpolate 32,32

set logscale x
set logscale y

set xrange [0.5:180]
#set yrange [sqrt(0.5):sqrt(4096)]
set yrange [0.5:4096]

#splot "quadApprox.csv" u 1:(sqrt($2)):5 w pm3d
splot "quadApprox.csv" u 1:2:5 w pm3d
