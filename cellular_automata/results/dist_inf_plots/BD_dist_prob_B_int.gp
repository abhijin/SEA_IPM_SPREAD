##### terminal
clear
# set loadpath '~/Dropbox/proj/gp/src'
set term tikz standalone size 12.5cm,8.75cm font ",14" gparrows scale 2,2 textscale 2
set datafile separator ','

##### output
set output 'BD_dist_prob_B_int.tex'

##### bg: bg color, axes, grid, tics
##### http://www.colourlovers.com/palette/268142/Danger_Mouse
Danger='#F84934'; # red
Shoes='#4D5E5F'; # grey
##### Rand Olson
roBlue='#1F77B4';
roRed='#D62728';
# border
set style line 21 lt 1 lc rgb '#808080' 
set border 3 back ls 21 lw 5
# grid
set style line 22 lt 2 lc rgb '#CCCCCC' lw 2
set style line 23 lt 2 lc rgb '#DDDDDD' lw 1
set grid xtics mxtics ytics mytics back ls 22, ls 23
# tics
set tics textcolor rgb '#303030'
set tics nomirror out scale 1,.1
set mxtics 2
set mytics 2

##### load default linestyles
set style increment user
# taken care of in terminal
do for [i=1:15] { set style line i lt 1 lw 7 }

##### line colors
# mathematica default
DarkBlue= '#5e82b5'
Orange=   '#e09c24'
Green=    '#8fb030'
Red=      '#eb634f'
Purple=   '#8778b3'
Brown=    '#c46e1a'
LightBlue='#5c9ec7'
Yellow=   '#FDBF6F'
MATHEMATICA="#5e82b5 #e09c24 #8fb030 #eb634f #8778b3 #c46e1a #5c9ec7 #FDBF6F"
do for[i=1:8] {set style line i lc rgb word(MATHEMATICA,i)}
####

##### data style
set style data linespoints;
set style line 1 pt 5
set style line 2 pt 7
set style line 3 pt 13
set style line 4 pt 17
set style line 5 pt 4
set style line 6 pt 6
set style line 7 pt 12
set style line 8 pt 16
#
set pointintervalbox 4.5
do for [i=1:15] {set style line i ps 2.75 pi -1}

# NOTE: offsets should be a function of font sizes
##### key
set key t l Left spacing 4 width 5 opaque font ",15"

##### tics (note that tics are also set in theme)
set xtics font ",15" offset 0,.2
set ytics font ",15" offset 1.5,0

##### plot
set title font ",15" "" offset -3,.3
set xlabel "Distance from first report location (kms)" offset 0,0 font ",15"
set ylabel "Accumulated probabilities at $t=48$" offset -2,0 font ",15"


unset title;        set key r t width 5;        set xlabel offset 0,.7;        set xtics offset 0,-.4;

plot       'model-B_s2_m2_48.csv' u 1:2 ls 2 pt 5 ti  '2'

set term x11 reset;
