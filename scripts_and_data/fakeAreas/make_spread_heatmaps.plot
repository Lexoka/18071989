set term png size 2560, 1440 font arial 36
set output "spread_v_af.png"
set xlabel "Exposant du paramètre A"
set ylabel "Exposant du paramètre F"
unset key

set pm3d map
#set pm3d interpolate 32,32

#set xrange[0.1:4]
#set yrange[0.1:4]

#set for [i=1:10] ytics (i)

splot "spread_v_af.csv" u 1:2:3 w pm3d
