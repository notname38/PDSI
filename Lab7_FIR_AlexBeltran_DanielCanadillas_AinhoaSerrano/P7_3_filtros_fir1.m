close all; clc;
[frase fs] = audioread('frase.wav');
% soundsc(frase, fs)
 
FRASE = fft(frase);
N = length(frase); f = (0:N-1)*fs/N;
 
% SeÃ±al sin filtrar:
figure; 
plot(f,abs(FRASE));   title("FRASE(F)");   xlabel("Frecuencia (Hz).");
figure; 
plot(f,abs(FRASE)); grid on;  title("Espectro de magnitud seÃ±al sin filtrar"); xlabel("Frecuencia (Hz).");
 
% 3.1
H1 = (f < 295) | ((f > 305) & (f < (fs-305))) | (f > (fs-295));
Y = FRASE .* H1';
figure;
subplot(2,1,1); plot(f,H1);      title("H3.1: Espectro de magnitud (respuesta frecuencial) seÃ±al filtro ideal");     xlabel("Frecuencia (Hz).");
subplot(2,1,2); plot(f,abs(Y)); title("Y3.1: Espectro de magnitud seÃ±al filtro ideal");                          xlabel("Frecuencia (Hz).");
 
% 3.2 El filtrado esta muy lejos del ideal.
M = 1000; h = fir1(M, [2*295/fs 2*305/fs], 'stop'); H2 = fft(h); FIR1 = (0:M)*fs/(M+1);
figure; plot(FIR1,abs(H2));  title("H3.2: Espectro de magnitud seÃ±al filtro M=1000 y Banda 295-305Hz"); xlabel("Frecuencia (Hz)."); xlim([0 M]); ylim([0 1.5]);
 
% 3.3 Mejora con mas puntos o aumentando el ancho.
M = 2000; h = fir1(M, [2*250/fs 2*350/fs], 'stop'); H3 = fft(h); FIR2 = (0:M)*fs/(M+1);
figure; plot(FIR2,abs(H3),'-');    title("H3.3: Espectro de magnitud seÃ±al filtro M=2000 y Banda 250-350Hz"); xlabel("Frecuencia (Hz)."); xlim([0 M]); ylim([-1 1.5]);
 
% 3.4
M = 600; h = fir1(M, [2*295/fs 2*305/fs], 'stop'); H41 = fft(h); FIR3 = (0:M)*fs/(M+1); y = conv(h,frase); soundsc(y, fs);
figure; plot(FIR3,abs(H41),'-');  title("H3.4.1: Espectro de magnitud seÃ±al filtro M = 600 y Banda 250-350Hz"); xlabel("Frecuencia (Hz)."); xlim([0 1000]); ylim([-1 1.5]);
 
M = 200; h = fir1(M, [2*250/fs 2*350/fs], 'stop'); H42 = fft(h); FIR4 = (0:M)*fs/(M+1); y = conv(h,frase); soundsc(y, fs);
figure; plot(FIR4,abs(H42),'-');  title("H3.4.2: Espectro de magnitud seÃ±al filtro M = 200 y Banda 250-350Hz"); xlabel("Frecuencia (Hz)."); xlim([0 1000]); ylim([-1 1.5]);
 
 
% El mega-gráfico:
H1 = abs(H1); H2 = abs(H2); H3 = abs(H3); H41 = abs(H41); H42 = abs(H42);
figure;  hold on;
plot(f, H1); plot(FIR1, H2); plot(FIR2, H3); plot(FIR3, H41); plot(FIR4, H42); xlim([0 M]); ylim([-1 1.5]);
hold off; legend("H1", "H2", "H3", "H4.1", "H4.2"); title("Combinacion final.");
