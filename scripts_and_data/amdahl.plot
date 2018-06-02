set term svg size 2560, 1440 fsize 100
set output "amdahl.svg"
set xlabel "p"
set ylabel "Accélération"

#unset key
#set nokey	

S(p) = 1/(1-p)
set dummy p
set xrange [0:0.9]

set key top left


set for [i=1:5] ytics (2*i)

set logscale y
#set ytics 1,1.2,10 # Multiplies everything by 1.2. Sucks.

plot S(p) lw 8 notitle
