set term svg size 2560, 1440 fsize 56
set output "profile.svg"
unset key

set xlabel "Temps (s)"
set ylabel "Vitesse du curseur (pixels/s)"

plot "seldf37.csv" u 1:9 w lines lw 4

set output "profile1.svg"
plot "seldf37.csv" u 1:10 w lines lw 4

set output "profile2.svg"
plot "seldf37.csv" u 1:11 w lines lw 4

set output "profile3.svg"
plot "seldf37.csv" u 1:12 w lines lw 4

set output "profile4.svg"
plot "seldf37.csv" u 1:13 w lines lw 4
