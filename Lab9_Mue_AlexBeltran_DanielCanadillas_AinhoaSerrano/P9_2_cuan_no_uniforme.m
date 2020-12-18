load('frase12.mat');
figure, plot(frase12,'.');
axis([0 35000 -1 1]);
title('frase12'),xlabel('muestras');
frase = mu255(frase12);
figure, plot(frase,'.');
title('frase12 - transformada con mu255'),xlabel('muestras');
axis([0 35000 -1 1]);
 
 
soundsc(frase12,fs);
 
% Cuantificación no uniforme a 4 bits
frase04cuan = round(frase*8)/8; %2^4 / 2 = 8 -> 4 bits
soundsc(frase04cuan,fs);
figure,
plot(frase04cuan,'.');
title('Cuantificación no uniforme a 4 bits'), xlabel('muestras');
axis([0 35000 -1 1]);
 
 
% Cuantificación a 4 bits
frase12_4_cuan = round(frase12*8)/8;
soundsc(frase12_4_cuan,fs);
figure,
plot(frase12_4_cuan,'.');
title('Cuantificación uniforme a 4 bits'), xlabel('muestras');
axis([0 35000 -1 1]);
 
% Inversa mu255 de la cuantificación a la señal cuantificada no uniformemente
inv = mu255inv(frase04cuan);
soundsc(inv,fs);
figure,
plot(inv,'.');
title('Inversa de cuantificación no uniforme a 4 bits'), xlabel('muestras');
axis([0 35000 -1 1]);
