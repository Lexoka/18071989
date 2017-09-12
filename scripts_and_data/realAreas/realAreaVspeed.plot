set term svg size 2560, 1440 fsize 46
set output "realAreaVspeed.svg"

set key top left
set xlabel "Vitesse (cm/s)"
set ylabel "Aire (cm²)"

#mean(x) = m
f(x) = a*x**2

fit f(x) "realArea_V_speed_A60_F8.csv" u 1:4 via a

stats "realArea_V_speed_A60_F8.csv" u 4:(f($1)) name "A"

plot "realArea_V_speed_A60_F8.csv" u 1:4 ps 2 title "Données",\
	f(x) title "Approximation quadratique : y = 1,84277x²" w l lw 6
