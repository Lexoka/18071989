set term svg size 2560, 1440 fsize 42
set output "area_1s_2s.svg"

set key top left
set xlabel "Aire sur 1 seconde (cm²)"
set ylabel "Aire sur 2 secondes (cm²)"

f(x) = a*x**2 + b*x

fit f(x) "resAndAreas_219_wo_1F.csv" u 17:22 via a,b

stats "resAndAreas_219_wo_1F.csv" u 22:(f($17)) name "A"

plot "resAndAreas_219_wo_1F.csv" u 17:22 ps 2 title "Données",\
	f(x) title "Approx. quadratique : y = 0,425551 x² + 0,93232 x" w l lw 6
