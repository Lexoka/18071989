set term svg size 2560, 1440 fsize 46
set output "spread_v_expa_over_expf.svg"

unset key

#set xrange[0.1:4]
#set yrange[0.1:4]

set ylabel "Dispersion"

set logscale x
#set xrange[0.02:50]
set xrange [0.004:500]
set for [i=1:2] xtics (0.01*i, 0.1*i, i, 10*i, 100*i)
set xtics (0.01, 0.02, 0.05, 0.1, 0.2, 0.5, 1, 2, 3, 5, 10, 20, 30, 50, 100, 200, 400)
#set xtics rotate by 90

plot "spread_v_af.csv" u ($1/$2):3
