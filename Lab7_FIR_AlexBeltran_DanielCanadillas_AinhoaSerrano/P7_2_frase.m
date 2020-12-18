load ej2.mat
[frase,fs] = audioread('frase.wav');
soundsc(frase, fs)
FRASE = fft(frase);
N = length(frase); 
f = (0:N-1)*fs/N;
figure, plot(f,abs(FRASE)), grid
 

y = conv(frase,h);
soundsc(y,fs)
 
n = 29441 + 43 - 1;
FRA=fft(frase,n);
F=(0:n-1)/n;
H=fft(h,n);
Y=fft(y,n);
 
figure, plot(F*fs,abs(FRA)); title('X(F)'), xlabel('Frec.(Hz)'), ylabel('Magnitud')
figure, plot(F*fs,abs(H)); title('H(F)'), xlabel('Frec.(Hz)'), ylabel('Magnitud')
figure, plot(F*fs,abs(Y)); title('Y(F)'), xlabel('Frec.(Hz)'), ylabel('Magnitud')
 
Y2 = FRA.*H';
y2 = real(ifft(Y2,n));
 
soundsc(y2,fs)
 
figure, plot(F*fs,abs(y2),'bx'); title('y2');
 
figure;
hold on;
plot(y,".:");
plot(y2,"g.:");
legend("y_t(n)","y_f(n)");
legend("Location","best");
title(‘Respuesta en el dominio temporal y frecuencial’);
hold off;
 
figure;
hold on;
plot(F*fs,abs(Y),’bx’);
plot(F*fs,abs(Y),’rx’); 
legend('Transformada desde aplicación en el dominio temporal - Y(F)','Aplicación desde el dominio frecuencial - Y(F)' );
legend("Location","best");
hold off;