set term svg size 2560, 1440 fsize 42
set output "asqrtFVgamma.svg"

#set term png size 2560, 1440 font arial 38
#set output "asqrtFVgamma.png"

set ylabel "Gamma"
unset key

f(x) = 9.9979731306 * (	1 + (x/150)**2	)**(-0.5)

plot "linApproxSorted.csv" u ($5):($3) ps 1 lw 6

set output "afVgamma.svg"
plot "linApprox.csv" u ($1*$2):3 ps 1 lw 6

set output "asqrtFVgammaLog.svg"
set logscale x
#set xrange [0.2:4400]
plot "linApproxSorted.csv" u ($5):($3) ps 1 lw 6

set output "asqrtFVgammaLogLogPowerFit.svg"
set logscale y
#set yrange [0.3:11]
set key
plot "linApproxSorted.csv" u ($5):($3) ps 1 lw 8 title "Données" ,\
	"linApproxSorted.csv" u 5:(f($5)) w l lw 12 title "Loi de puissance courbée	"
