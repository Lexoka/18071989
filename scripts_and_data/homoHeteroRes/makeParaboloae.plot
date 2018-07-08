set term svg size 1920, 1440 fsize 66
set output "parabola1.svg"
unset key

N = 1.0
M = 1 / ( 1 - N/12.0 )
f(x) = M*(1-N*(x - 0.5)**2)

set xrange [0:1]
set yrange [0:1.6]

set xlabel "Espérance de l'aire de l'enveloppe convexe normalisée"
set ylabel "Facteur de mise à l'échelle"

plot f(x) lw 6


set output "parabola2.svg"
N = 2.0
M = 1 / ( 1 - N/12.0 )
plot f(x) lw 6

set output "parabola3.svg"
N = 3.0
M = 1 / ( 1 - N/12.0 )
plot f(x) lw 6

set output "parabola4.svg"
N = 4.0
M = 1 / ( 1 - N/12.0 )
plot f(x) lw 6
