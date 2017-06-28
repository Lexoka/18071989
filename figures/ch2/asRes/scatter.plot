set terminal svg size 640,480 fname 'Verdana' fsize 18
set output 'asRes.svg'

set style fill solid 1.0 border
unset key

set xlabel "Error rate (%)"
set ylabel "Mean selection time (s)"
set xrange [0:50]
set yrange [0:2]
plot "asRes.data" using 2:3 with circles, \
	"" using 2:3:1 with labels offset 0, char -1

