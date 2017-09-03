#set term svg size 1200, 800 fsize 36
#set output "afVgamma.svg"

set term png size 2560, 1440 font arial 38
set output "asqrtFVgamma.png"

#set xlabel "A × Racine(F)"
set ylabel "Gamma"
unset key

#plot "linApprox.csv" u (sqrt(sqrt($1*sqrt($2)))):3 ps 1 lw 6
plot "linApprox.csv" u ($1*sqrt($2)):3 ps 1 lw 6


#set xlabel "A × F"
set output "afVgamma.png"
plot "linApprox.csv" u ($1*$2):3 ps 1 lw 6

set output "asqrtFVgammaLog.png"
set logscale x
set xrange [0.2:4400]
plot "linApprox.csv" u ($1*sqrt($2)):3 ps 1 lw 6
