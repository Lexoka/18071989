set term svg size 1200, 800 fsize 36
set output "amdahl.svg"
set xlabel "p"
set ylabel "Accélération"

S(p) = 1/(1-p)
set dummy p
set xrange [0:0.8]
#set logscale y
set key top left
set ytics 1, 0.3, 10

plot S(p) lw 5
