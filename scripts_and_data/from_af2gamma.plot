set term svg size 2560, 1440 fsize 42
set output "asqrtFVgamma.svg"

set ylabel "Gamma"
unset key

f(x) = 10.0 * (	1 + (x/150)**2	)**(-0.5)

#g(x) = 10.0 * (1 + (x/150)**s)**(1.0/s)

plot "linApproxSorted.csv" u 5:3 ps 1 lw 6

set output "afVgamma.svg"
plot "linApprox.csv" u ($1*$2):3 ps 1 lw 6

#fit g(x) "linApproxSorted.csv" u 5:3 via s
#stats "linApproxSorted.csv" u 3:(g($5)) name "A"
stats "linApproxSorted.csv" u 3:(f($5)) name "A"

set output "asqrtFVgammaLog.svg"
set logscale x
set xrange [0.2:13000]
plot "linApproxSorted.csv" u 5:3 ps 1 lw 6



set output "asqrtFVgammaLogLogPowerFit.svg"
set logscale y
set yrange [0.1:11]
set key center left
plot "linApproxSorted.csv" u 5:3 ps 1 lw 8 title "Données" ,\
	"linApproxSorted.csv" u 5:(f($5)) w l lw 12 title "Loi de puissance courbée"
