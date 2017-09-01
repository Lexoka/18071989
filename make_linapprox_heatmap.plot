#set term svg size 1200, 800 fsize 36
#set output "linApprox.svg"

set term png size 1920, 1080 font arial 36
set output "linApprox.png"
set xlabel "Angle"
set ylabel "Fréquence"
unset key

set pm3d map
#set pm3d interpolate 30,30
set pm3d interpolate 32,32

splot "linApprox.csv" u 1:2:3 w pm3d

set output "linApprox_log.png"
set logscale y
set yrange [0.5:240]
splot "linApprox.csv" u 1:2:3 w pm3d
