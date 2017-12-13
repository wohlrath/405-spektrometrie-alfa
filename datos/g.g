#!/usr/bin/gnuplot

set terminal epslatex size 18cm,12cm
set output 'DTP.tex'
unset parametric

set title
set xlabel '$P$ (\si{\hecto\pascal})'
set ylabel '$T$ (\si{\keV})'
set grid x,y
set yrange[0:3500]
set xrange[0:1000]
set key top left


f(x)=5485.74+b*x+c*x**2+d*x**3
fit f(x) 'ep' via b,c,d
DT(x)=5485.74-f(x)


set xlabel 'T (keV)'
set ylabel 'f (MeV/m)'

plot 'ep' u 1:(5485.74-$2)  lw 2 ps 3 t 'naměřené hodnoty', DT(x) lw 2 t 'kubický fit'


set xrange[2000:6000]
set yrange[0:150]
teor(x)= x<=5500 ? (x>=2250 ? 100.0*2/3/0.31/sqrt(x/1000):1/0):1/0
#fit teor(x) 'ep' u 2:(rP0*$3) via A

set terminal pngcairo enhanced size 640, 480
set output 'f.png'


set parametric
set trange[0:960]
set xrange[2000:6000]
set yrange[80:160]
#set xlabel 'T (keV)'
#set ylabel 'f (MeV/m})'
set key top right

rP0=96.0/3
df(x)=b+2*c*x+3*d*x**2

map(x)=2000+4000.0/960*x

F(x)=-rP0*df(x)



plot 'ep' u 2:(rP0*$3) t 'z naměřených hodnot', f(t),F(t) t 'z kubického fitu', map(t), teor(map(t)) title 'teoretická závislost'

unset parametric