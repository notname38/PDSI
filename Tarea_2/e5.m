% e5.m: harmonics
figure
fs = 22050;
d = 1;
s1 = tone(440,0,d,fs); subplot(6,1,1), plot(s1(1:100))
s2 = tone(880,0,d,fs); subplot(6,1,2), plot(s2(1:100))
s3 = tone(1320,0,d,fs); subplot(6,1,3), plot(s3(1:100))
s4 = tone(1760,0,d,fs); subplot(6,1,4), plot(s4(1:100))
s5 = tone(2200,0,d,fs); subplot(6,1,5), plot(s5(1:100))
suma = (s1 + .8*s2 + .6*s3 + .4*s4 + .2*s5)/3; subplot(6,1,6), plot(suma(1:100))
drawnow
s=[s1 s2 s3 s4 s5 suma s1 suma s1];
soundsc(s,fs)
