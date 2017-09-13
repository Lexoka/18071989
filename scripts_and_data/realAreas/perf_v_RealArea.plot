set term svg size 2560, 1440 fsize 46

set xlabel "Aire"
set ylabel "Temps de sélection moyen normalisé"

set output "perf_V_RealArea_raw.svg"
plot "realAreas_from_AF_interact_073.csv" u 4:8 ps 1 pt 7 lc 1 lw 3 title "0,73 cm/s",\
	"realAreas_from_AF_interact_146.csv" u 4:8 ps 1 pt 7 lc 2 lw 3 title "1,46 cm/s",\
	"realAreas_from_AF_interact_219.csv" u 4:8 ps 1 pt 7 lc 3 lw 3 title "2,19 cm/s"


set xlabel "Aire/V²"
set ylabel "Temps de sélection moyen normalisé/V"
set output "perf_V_RealArea_normed.svg"
plot "realAreas_from_AF_interact_146.csv" u 5:9 ps 1 pt 7 lc 2 lw 3 title "1,46 cm/s",\
	"realAreas_from_AF_interact_219.csv" u 5:9 ps 1 pt 7 lc 3 lw 3 title "2,19 cm/s"


set output "perf_V_RealArea_lousy_fit.svg"
f(x) = a*x**2 + b*x + c

fit f(x) "realAreas_from_AF_interact_146_219.csv" u 5:9 via a,b,c
stats "realAreas_from_AF_interact_146_219.csv" u 9:(f($5)) name "A"

plot "realAreas_from_AF_interact_146_219.csv" u 5:9 ps 1 pt 7 lc 6 lw 3 title "Données",\
	f(x) lw 6 title "Approx. poly. : y = -0,082x² + 0,209x + 0,105"


##########################################################################################
set output "perf_V_RealArea_better_fit.svg"
g(x) = a*x**2 + b*x + c

fit g(x) "realAreas_from_AF_interact_219_HF.csv" u 5:9 via a,b,c
stats "realAreas_from_AF_interact_219_HF.csv" u 9:(f($5)) name "A"

plot "realAreas_from_AF_interact_219_HF.csv" u 5:9 ps 1 pt 7 lc 7 lw 3 title "Données de haute fréquence",\
	g(x) lw 6 title "Approx. poly. : y = -0,097x² + 0,252x + 0,096"

#set ylabel "Erreurs"
#set output "errorsVareaEverythingNormed.svg"
#plot "resAndAreas_146.csv" u ($22/$3):($6/$3) ps 1 pt 7 lc "#100191970" lw 3 title "1,46 cm\s",\
#	"resAndAreas_219.csv" u ($22/$3):($6/$3) ps 1 pt 7 lc 7 lw 3 title "2,19 cm\s"

#set output "ucErrorsVareaEverythingNormed.svg"
#plot "resAndAreas_146.csv" u ($22/$3):($5/$3) ps 1 pt 7 lc 6 lw 3 title "1,46 cm\s",\
#	"resAndAreas_219.csv" u ($22/$3):($5/$3) ps 1 pt 7 lc 7 lw 3 title "2,19 cm\s"
