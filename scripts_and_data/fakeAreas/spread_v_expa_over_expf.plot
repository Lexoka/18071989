set term svg size 2560, 1440 fsize 46
set output "spread_v_expa_over_expf.svg"

unset key

#set xrange[0.1:4]
#set yrange[0.1:4]

set ylabel "Dispersion"

#set for [i=1:10] ytics (i)
set logscale x
set xrange[0.02:50]
set for [i=1:4] xtics (0.1*i, i, 10*i)
#set xtics rotate by 90

plot "spread_v_af.csv" u ($1/$2):3
