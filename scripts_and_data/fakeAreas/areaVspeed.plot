set term svg size 2560, 1440 fsize 76
set output "areaVspeed.svg"

set key bottom right
set xlabel "Vitesse (cm/s)"
set ylabel "Périmètre (cm)"

#mean(x) = m
f(x) = a*x

fit f(x) "areaVspeed.csv" u 1:4 via a

stats "areaVspeed.csv" u 4:(f($1)) name "A"

plot "areaVspeed.csv" u 1:4 ps 2 title "Données",\
	f(x) title "Approx. linéaire : y = 3,66442x" w l lw 6
