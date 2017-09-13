set term svg size 2560, 1440 fsize 46
set output "a_rootF_delta.svg"

set ylabel "Delta"
set key bottom left

a = 0.97
b = -1.83
uBound = 5.0

f(x) = uBound / ( ( 1/(x**a) ) + ( 1/(x**b) ) )

ga = 0.97
gb = 1.0
beta = -2.78
N = 0.05
bend = 120
g(x) = N * x**ga * ( 1 + (x/bend)**(abs(beta)*gb) )**(sgn(beta)/gb)

stats "quadApproxSorted.csv" u 5:(g($4)) name "A"

set logscale x
set logscale y
set xrange [0.2:13000]
set yrange [0.001:4]

plot "quadApproxSorted.csv" u 4:5 title "Données" ,\
	g(x) lw 10 title "Lois de puissance combinées"
	#f(0.0085*x) lw 6,\

set output "af_delta.svg"
set xrange [0.2:860000]
unset key
plot "quadApproxSorted.csv" u 3:5
