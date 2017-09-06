#set term svg size 1200, 800 fsize 36
#set output "afVgamma.svg"

set term png size 2560, 1440 font arial 38
set output "asqrtFVgamma.png"

#set xlabel "A × Racine(F)"
#set ylabel "Gamma"
unset key

a = -10
b = 10
c = 0.01
d = 10

gr(x) = 10 - x


plot "linApproxSorted.csv" u ($5):($3) ps 1 lw 6,\
	"linApproxSorted.csv" u 5:(	d + a*exp( -b*exp(-c*($5)	)	) ) w l lw 8
	#"linApprox.csv" u ($1*sqrt($2)):(	d + a*exp( -b*exp(- gr( ($1*sqrt($2)) ) *	($1*sqrt($2))	) )	)



#set xlabel "A × F"
set output "afVgamma.png"
plot "linApprox.csv" u ($1*$2):3 ps 1 lw 6

set output "asqrtFVgammaLog.png"
set logscale x
set xrange [0.2:4400]
plot "linApprox.csv" u ($1*sqrt($2)):3 ps 1 lw 6
