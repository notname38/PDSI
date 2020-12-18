frase10=round(frase12*512)/512; %2^10/2=512
frase8=round(frase12*128)/128;   %2^8 /2=128
frase4=round(frase12*8)/8;           %2^4/2=8

%Escuchar las señales
soundsc(frase12,fs);
soundsc(frase10,fs);
soundsc(frase8,fs);
soundsc(frase4,fs);


%Visualiza el segmento comprendido entre 300 y 400
figure, plot(frase12,'.');
hold on;
plot(frase10,'o');
plot(frase8,'+');
plot(frase4,'*');
hold off;
title("Visualización conjunta"); axis([300 400 -0.015 0.015]);
legend('frase12','frase10', 'frase8', 'frase4')

%Cálculo de errores absolutos
error10=sum(abs(frase12-frase10));  %error10=16.5103
error8=sum(abs(frase12-frase8));    %error8=67.77
error4=sum(abs(frase12-frase4));    %error4=632.8140

%Grafico de barras - error absoluto de las tres señales (error por cuantificación)
c = categorical({'Error 10','Error 8','Error 4'});
bar(c, [error10, error8, error4]); title("Error absoluto de las tres señales");

%Visualización de los espectros de magnitud
F=(0:34999)/35000;
f12=fft(frase12,35000); 
f10=fft(frase10,35000); 
f8=fft(frase8,35000); 
f4=fft(frase4,35000); 
figure, 
subplot(2,2,1), plot(F,abs(f12)), title('Frase 12 - magnitud(F)'), xlabel('Frec.(c/m)');
subplot(2,2,2), plot(F,abs(f10)), title('Frase 10 - magnitud(F)'), xlabel('Frec.(c/m)');
subplot(2,2,3), plot(F,abs(f8)), title('Frase 8 - magnitud(F)'), xlabel('Frec.(c/m)');
subplot(2,2,4), plot(F,abs(f4)), title('Frase 4 - magnitud(F)'), xlabel('Frec.(c/m)');

%Grafico de barras - error absoluto de los espectros de las tres señales (error por cuantificación)
error10m=sum(abs(f12-f10));  %error10m=3.336e+03
error8m=sum(abs(f12-f8));    %error8m=1.3e+04
error4m=sum(abs(f12-f4));    %error4m=1.464e+05
 
c = categorical({'Error 4','Error 8','Error 10'});
bar(c, [error4m, error8m, error10m]); title("Error absoluto de las tres señales - Magnitud");