set term svg size 2560, 1440 fsize 46
set output "asqrtFVgamma.svg"

set ylabel "Gamma"
unset key

ubp(x) = 1000*x**(-0.95)
f(x) = 10.0 * (	1 + (x/150)**2	)**(-0.5)

#g(x) = 10.0 * (1 + (x/150)**s)**(1.0/s)

set yrange [0.1:10.5]

plot "linApproxSorted.csv" u 5:3

set output "afVgamma.svg"
plot "linApprox.csv" u ($1*$2):3

#fit g(x) "linApproxSorted.csv" u 5:3 via s
#stats "linApproxSorted.csv" u 3:(g($5)) name "A"
stats "linApproxSorted.csv" u 3:(f($5)) name "A"

set output "asqrtFVgammaLog.svg"
set logscale x
set xrange [0.2:13000]
plot "linApproxSorted.csv" u 5:3

set output "asqrtFVgammaLogLogUnbrokenPowerFit.svg"
set logscale y
set yrange [0.1:11]
set key center left
plot "linApproxSorted.csv" u 5:3 title "Données",\
	"linApproxSorted.csv" u 5:(ubp($5)) w l lw 12 title "Loi de puissance pure"

set output "asqrtFVgammaLogLogPowerFit.svg"
plot "linApproxSorted.csv" u 5:3 title "Données" ,\
	"linApproxSorted.csv" u 5:(f($5)) w l lw 12 title "Loi de puissance courbée"
