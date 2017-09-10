set term svg size 2560, 1440 fsize 42
set output "area_1s_2s.svg"

set key top left
set xlabel "Aire sur 1 seconde (cm²)"
set ylabel "Aire sur 2 secondes (cm²)"

#f(x) = a*x**2 + b*x
f(x) = a*x**2

#fit f(x) "resAndAreas_219_wo_1F.csv" u 17:22 via a,b
fit f(x) "resAndAreas_219_wo_1F.csv" u 17:22 via a

stats "resAndAreas_219_wo_1F.csv" u 22:(f($17)) name "A"

plot "resAndAreas_219_wo_1F.csv" u 17:22 ps 2 title "Données",\
	f(x) title "Approximation quadratique : y = 0,790813 x²" w l lw 6
