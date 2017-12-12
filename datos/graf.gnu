#!/usr/bin/gnuplot

set terminal epslatex size 18cm,12cm color colortext
set output 'graf.tex'

set title
set xlabel ''
set ylabel ''
set grid x,y
set yrange[0:10]
set xrange[0:10]

plot x

set terminal wxt
set output
