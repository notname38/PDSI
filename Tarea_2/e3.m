% e3.m: Jurassic park
clear all; clc; close all;

fs=22050;

speed=1.5;

d1=2*speed;
d2=1*speed;
d4=.5*speed;
d8=.25*speed;

P1=zeros(1,int8(2*fs));
P2=zeros(1,int8(1*fs));
P4=zeros(1,int8(.5*fs));
P8=zeros(1,int8(.25*fs));


fa2_2 = tone(174.61,0,d2,fs);
do3_2=tone(261.63,0,d2,fs);
re3_2=tone(293.66,0,d2,fs);
mi3_2=tone(329.63,0,d2,fs);
fa3_2=tone(349.23,0,d2,fs);
sol3_2=tone(392,0,d2,fs);
la3_2=tone(440,0,d2,fs);
si3b_2=tone(466.16,0,d2,fs);
si3_2=tone(493.88,0,d2,fs);
do4_2=tone(523.25,0,d2,fs);
do4s_2=tone(554.37,0,d2,fs);
re4_2=tone(587.33,0,d2,fs);
mi4_2=tone(659.26,0,d2,fs);
fa4_2=tone(698.46,0,d2,fs);
sol4_2=tone(783.99,0,d2,fs);
la4_2=tone(880.00,0,d2,fs);
si4b_2=tone(932.33,0,d2,fs);
si4_2=tone(987.77,0,d2,fs);
do5_2=tone(1046.5,0,d2,fs);
do5s_2=tone(1108.7,0,d2,fs);

fa2_4 = tone(174.61,0,d4,fs);
do3_4=tone(261.63,0,d4,fs);
re3_4=tone(293.66,0,d4,fs);
mi3_4=tone(329.63,0,d4,fs);
fa3_4=tone(349.23,0,d4,fs);
sol3_4=tone(392,0,d4,fs);
la3_4=tone(440,0,d4,fs);
si3b_4=tone(466.16,0,d4,fs);
si3_4=tone(493.88,0,d4,fs);
do4_4=tone(523.25,0,d4,fs);
do4s_4=tone(554.37,0,d4,fs);
re4_4=tone(587.33,0,d4,fs);
mi4_4=tone(659.26,0,d4,fs);
fa4_4=tone(698.46,0,d4,fs);
sol4_4=tone(783.99,0,d4,fs);
la4_4=tone(880.00,0,d4,fs);
si4b_4=tone(932.33,0,d8,fs);
si4_4=tone(987.77,0,d4,fs);
do5_4=tone(1046.5,0,d4,fs);
do5s_4=tone(1108.7,0,d4,fs);

fa2_8 = tone(174.61,0,d8,fs);
do3_8=tone(261.63,0,d8,fs);
re3_8=tone(293.66,0,d8,fs);
mi3_8=tone(329.63,0,d8,fs);
fa3_8=tone(349.23,0,d8,fs);
sol3_8=tone(392,0,d8,fs);
la3_8=tone(440,0,d8,fs);
si3b_8=tone(466.16,0,d8,fs);
si3_8=tone(493.88,0,d8,fs);
do4_8=tone(523.25,0,d8,fs);
do4s_8=tone(554.37,0,d8,fs);
re4_8=tone(587.33,0,d8,fs);
mi4_8=tone(659.26,0,d8,fs);
fa4_8=tone(698.46,0,d8,fs);
fa4s_8=tone(739.99,0,d8,fs);
sol4_8=tone(783.99,0,d8,fs);
la4_8=tone(880.00,0,d8,fs);
si4b_8=tone(932.33,0,d8,fs);
si4_8=tone(987.77,0,d8,fs);
do5_8=tone(1046.5,0,d8,fs);
do5s_8=tone(1108.7,0,d8,fs);


t1=[P4,P2, fa4_8,mi4_8,...
    fa4_2,P4,fa4_8,mi4_8,...
    fa4_2,P4,fa4_8,mi4_8,...
    fa4_4,P8,sol4_8,sol4_4,P8,si4b_8,...
    si4b_2,si4b_4,la4_8,fa4_8,...
    sol4_4,sol4_8,mi4_8,do4_4,la4_8,fa4_8,...
    sol4_2,P4,do4_8,fa4_8,...
    si4b_4,P8,la4_8,la4_4,P8,sol4_8,...
    sol4_2,P4];
    
soundsc(t1,fs);




