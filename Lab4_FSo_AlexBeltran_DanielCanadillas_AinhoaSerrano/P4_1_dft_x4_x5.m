% x4
nn = 0:99;
x4 = 3 - rem(-nn,7);
dtft(x4,0,1000);
 
% x5
nn = 0:128;
x5_1 = (nn(1:63)/64).*sin(nn(1:63).*pi./16);
x5_2 = (2-(nn(64:128)/64)).*sin(pi./4.*nn(64:128));
x5 = [x5_1 x5_2];
dtft(x5,0,1000);
