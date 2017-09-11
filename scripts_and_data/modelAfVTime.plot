set term svg size 2560, 1440 fsize 46

set ylabel "Temps de sélection moyen normalisé/V"

set output "timeVafFit.svg"

#f(x) = 0.002*x - 0.1
#sigma = 0.6

#g(x) = 0.3*(f(x)/sigma**2)*exp( (-f(x)*f(x))/(2*sigma**2) ) + 0.3

a = 1.41728564
b = 0.67526069
c = 0.01
d = 0.31374369
sigma = 2.31879762

g(x) = a*((c*x-b)/sigma**2)*exp( (-(c*x-b)*(c*x-b))/(2*sigma**2) ) + d


#fit g(x) "areaTimeFit.csv" u 1:2 via sigma # Helps, but not enough to justify deviating from the neat little 3
# Try scipy.

stats "exploAF.csv" u 10:(g($9)) name "A"

#set xrange [1:11] # Never put this before stats, or it will shit the bed.

plot "exploAF.csv" u 9:10 pt 7 lw 4 title "Données, 1,46 et 2,19 cm/s",\
	g(x) lw 12 title "Modèle"
