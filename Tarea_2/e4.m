% e4.m: perfect cadence
clear all; clc; close all;

fs=22050;
d=.5;
do3=tone(261.63,0,d,fs);
re3=tone(293.66,0,d,fs);
mi3=tone(329.63,0,d,fs);
fa3=tone(349.23,0,d,fs);
sol3=tone(392,0,d,fs);
la3=tone(440,0,d,fs);
si3b=tone(466.16,0,d,fs);
si3=tone(493.88,0,d,fs);
do4=tone(523.25,0,d,fs);
re4=tone(587.33,0,d,fs);
mi4=tone(659.26,0,d,fs);
fa4=tone(698.46,0,d,fs);
sol4=tone(783.99,0,d,fs);
la4=tone(880.00,0,d,fs);
si4=tone(987.77,0,d,fs);
do5=tone(1046.5,0,d,fs);
do5s=tone(1108.7,0,d,fs);

% perfect cadence
p=zeros(1,20000);
s2=[do3,mi3,sol3,si3b,p,fa3,la3,do4,fa4];
soundsc(s2,fs);

%pause

s3=(do3+mi3+sol3+si3b)/4;
s4=(fa3+la3+do4+fa4)/4;
s5 = [s3,p,s4];
soundsc(s5,fs);

