#set term svg size 1200, 800 fsize 36
#set output "linApprox.svg"

set term png size 2560, 1440 font arial 36
set output "afArea.png"
set xlabel "Angle"
set ylabel "Fréquence"
unset key

set pm3d map
set pm3d interpolate 32,32
set yrange [0.5:512]

splot "areasFromAF.csv" u 2:1:4 w pm3d

set output "afArea_log.png"
set logscale y
splot "areasFromAF.csv" u 2:1:4 w pm3d
