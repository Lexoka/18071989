set term svg size 2560, 1440 fsize 46
set output "durationVarea.svg"

set xlabel "Durée (s)"
set ylabel "Périmètre moyen (cm)"

set key top left

#f(x) = a*x
g(x) = 2*x

#fit f(x) "durationVarea.csv" u 1:2 via a
#stats "durationVarea.csv" u 2:(f($1)) name "A"
stats "durationVarea.csv" u 2:(g($1)) name "B"

plot "durationVarea.csv" u 1:2 ps 2 title "Données",\
	"durationVarea.csv" u 1:(g($1)) w l lw 6 title "Approximation linéaire : y = 2x"
