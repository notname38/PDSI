%e6: timbre
figure
fs = 22050;
d = 1;
s1 = tone(440,0,d,fs); subplot(6,1,1), plot(s1(1:100))
s2 = tone(880,0,d,fs);
s3 = tone(1320,0,d,fs);
s4 = tone(1760,0,d,fs);
s5 = tone(2200,0,d,fs);
p = zeros(1,5000);

sum1 = (s1 + .6*s2)/2.4;
subplot(6,1,2), plot(sum1(1:100))

sum2 = (s1 + .6*s2 + .4*s3)/2.4;
subplot(6,1,3), plot(sum2(1:100))

sum3 = (s1 + .7*s2 + .3*s3 + .2*s4)/2.4;
subplot(6,1,4), plot(sum3(1:100))

sum4 = (s1 + .8*s2 + .6*s3 + .4*s4 + .2*s5)/2.5;
subplot(6,1,5), plot(sum4(1:100))

sum5 = (s1 + .2*s2 + .1*s3 + .1*s4 + .3*s5)/1.2;
subplot(6,1,6), plot(sum5(1:100))

drawnow
s=[s1 p sum1 p sum2 p sum3 p sum4 p sum5];
soundsc(s,fs)
