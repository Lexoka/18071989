#set term png size 2560, 1440 font arial 38
set term svg size 2560, 1440 fsize 46

set xlabel "Aire"
set ylabel "Temps de sélection moyen normalisé"

set output "perfVareaRaw.svg"
plot "resAndAreas_073.csv" u 22:5 ps 1 pt 7 lc 1 lw 3 title "0,73 cm/s",\
	"resAndAreas_146.csv" u 22:5 ps 1 pt 7 lc 2 lw 3 title "1,46 cm/s" ,\
	"resAndAreas_219.csv" u 22:5 ps 1 pt 7 lc 3 lw 3 title "2,19 cm\s "

set ylabel "Temps de sélection moyen normalisé/vitesse"
set output "perfVareaTimeNormedAll.svg"
plot "resAndAreas_073.csv" u 22:($4/$3) ps 1 pt 7 lc 1 lw 3 title "0,73 cm/s",\
	"resAndAreas_146.csv" u 22:($4/$3) ps 1 pt 7 lc 2 lw 3 title "1,46 cm\s",\
	"resAndAreas_219.csv" u 22:($4/$3) ps 1 pt 7 lc 3 lw 3 title "2,19 cm\s"

set output "perfVareaTimeNormed.svg"
plot "resAndAreas_146.csv" u 22:($4/$3) ps 1 pt 7 lc 2 lw 3 title "1,46 cm\s",\
	"resAndAreas_219.csv" u 22:($4/$3) ps 1 pt 7 lc 3 lw 3 title "2,19 cm\s"

set xlabel "Aire/vitesse"
set output "perfVareaEverythingNormedAll.svg"
plot "resAndAreas_073.csv" u ($22/$3):($4/$3) ps 1 pt 7 lc 1 lw 3 title "0,73 cm/s",\
	"resAndAreas_146.csv" u ($22/$3):($4/$3) ps 1 pt 7 lc 2 lw 3 title "1,46 cm\s",\
	"resAndAreas_219.csv" u ($22/$3):($4/$3) ps 1 pt 7 lc 3 lw 3 title "2,19 cm\s"

set output "perfVareaEverythingNormed.svg"
plot "resAndAreas_146.csv" u ($22/$3):($4/$3) ps 1 pt 7 lc 2 lw 3 title "1,46 cm\s",\
	"resAndAreas_219.csv" u ($22/$3):($4/$3) ps 1 pt 7 lc 3 lw 3 title "2,19 cm\s"

set ylabel "Erreurs"
set output "errorsVareaEverythingNormed.svg"
plot "resAndAreas_146.csv" u ($22/$3):($6/$3) ps 1 pt 7 lc "#100191970" lw 3 title "1,46 cm\s",\
	"resAndAreas_219.csv" u ($22/$3):($6/$3) ps 1 pt 7 lc 7 lw 3 title "2,19 cm\s"

set output "ucErrorsVareaEverythingNormed.svg"
plot "resAndAreas_146.csv" u ($22/$3):($5/$3) ps 1 pt 7 lc 6 lw 3 title "1,46 cm\s",\
	"resAndAreas_219.csv" u ($22/$3):($5/$3) ps 1 pt 7 lc 7 lw 3 title "2,19 cm\s"
