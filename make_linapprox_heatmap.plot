#set term svg size 1200, 800 fsize 36
#set output "linApprox.svg"

set term png size 2560, 1440 font arial 36
set output "linApprox.png"
set xlabel "Angle"
set ylabel "Fréquence"
unset key

set pm3d map
set pm3d interpolate 32,32
set yrange [0.5:4096]

splot "linApprox.csv" u 1:2:3 w pm3d

set output "linApprox_log.png"
set logscale y
set logscale x
set xrange [0.5:180]
splot "linApprox.csv" u 1:2:3 w pm3d
