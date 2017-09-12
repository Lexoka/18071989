set term svg size 2560, 1440 fsize 46

set xlabel "Périmètre/V"
set ylabel "Temps de sélection moyen normalisé/V"

set output "timeVareaFit.svg"


# RayleighPdf(x, a, b, sigma, d)


a = 1.74346771
b = 1.49387322
d = 0.27334901
sigma = 2.45413832

f(x) = x-b
g(x) = a*(f(x)/sigma**2)*exp( (-f(x)*f(x))/(2*sigma**2) ) + d

#fit g(x) "areaTimeFit.csv" u 1:2 via sigma # Helps, but not enough to justify deviating from the neat little 3
# Try scipy.

stats "areaTimeFit.csv" u 2:(g($1)) name "A"

set xrange [1:11] # Never put this before stats, or it will shit the bed.

plot "areaTimeFit.csv" u 1:2 pt 7 lw 4 title "Données, 1,46 et 2,19 cm/s",\
	g(x) lw 12 title "Modèle"
