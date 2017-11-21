set term png size 2560, 1440 font arial 40
set output "afArea.png"
set xlabel "Angle (degrés)"
set ylabel "Fréquence (Hz)"
unset key

set pm3d map
set pm3d interpolate 32,32
set yrange [0.5:4096]

splot "areasFromAF.csv" u 2:1:4 w pm3d

set output "afArea_log.png"
set logscale y
set logscale x
set xrange [0.5:180]
splot "areasFromAF.csv" u 2:1:4 w pm3d
