% e1.m: example of music scale
clear all; clc; close all;

fs=8192;
d=.4;
phi=0;
do=tone(261.63,phi,d,fs);
re=tone(293.66,phi,d,fs);
mi=tone(329.63,phi,d,fs);
fa=tone(349.23,phi,d,fs);
sol=tone(392,phi,d,fs);
la=tone(440,phi,d,fs);
si=tone(493.88,phi,d,fs);
do4=tone(523.25,phi,d,fs);
s=[do re mi fa sol la si do4];
soundsc(s,fs)
