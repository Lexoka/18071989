set term svg size 1200, 800 fsize 36
set output "linApprox.svg"
set xlabel "Angle"
set ylabel "Fréquence"

set pm3d map
#set pm3d interpolate 30,30
set pm3d interpolate 8,8

splot "linApprox.csv" u 1:2:3 w pm3d
