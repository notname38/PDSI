%% Ejercicio 3: P8_3_filtros_iir
close all; clear; clc;
[frase fs] = audioread("frase.wav");
% [hBka,wBka] = freqz(b,a);

%% BUTTERS:

%% B1
% no sale un filtro adecuado por tener una banda demasiado
% estrecha para el orden del filtro
[b,a]=butter(5,[290,310]*2/fs,'stop');
% a y b tienen 2*5+1 elementos
[hB1,wB1] = freqz(b,a,'whole');
fB1 = (wB1/(2*pi))*fs;
%figure, plot(fB1,abs(hB1)),
%title("hB1 - 290-310"),
%xlabel("Hz");
%axis([0 600 -0.5 4]);
yB1 = filter(b,a,frase);
soundsc(yB1,fs);

%% B2
% El filtro es muy sensible al ancho de banda
% Se puede jugar con el ancho de banda o el orden del filtro
[b,a] = butter(5, [250,350]*2/fs, 'stop');
% El whole para calcular todo el espectro.
[hB2,wB2] = freqz(b,a,'whole');
fB2 = (wB2/(2*pi))*fs;
%figure, plot(fB2,abs(hB2)),
%title("hB2 - 250-350"),
%xlabel("Hz");
%axis([0 600 0 1.5]);
yB2 = filter(b,a,frase);
soundsc(yB2,fs);

%% B3
[b,a] = butter(4, [250,350]*2/fs, 'stop');
[hB3,wB3] = freqz(b,a,'whole');
fB3 = (wB3/(2*pi))*fs;
%figure, plot(fB3,abs(hB3)),
%title("hB3 - 250-350"),
%xlabel("Hz");
%axis([0 600 -0.5 4]);
yB4a = filter(b, a, frase);
soundsc(yB4a, fs);

%% B4
[b,a] = butter(4, [290,310]*2/fs, 'stop');
[hB4,wB4] = freqz(b,a,'whole');
fB4 = (wB4/(2*pi))*fs;
%figure, plot(fB4,abs(hB4)),
%title("hB4 - 290-310"),
%xlabel("Hz");
%axis([0 600 -0.5 4]);
yB4b = filter(b, a, frase);
soundsc(yB4b, fs);

%% B5
[b,a] = butter(3, [270,330]*2/fs, 'stop');
[hB5,wB5] = freqz(b,a,'whole');
fB5 = (wB5/(2*pi))*fs;
%figure, plot(fB5,abs(hB5)),
%title("hB5 - 270-330"),
%xlabel("Hz");
%axis([0 600 -0.5 4]);
yB3a = filter(b, a, frase);
soundsc(yB3a, fs);

% Figure con todos los BUTTER superpuestos
figure, hold on, xlabel("Hz"), axis([0 600 -0.5 4]);
title("Filtros: ");
plot(fB1,abs(hB1));
plot(fB2,abs(hB2));
plot(fB3,abs(hB3));
plot(fB4,abs(hB4));
plot(fB5,abs(hB5));
legend("hB1-290-310", "hB2-250-350", "hB3-250-350", "hB4-290-310", "hB5-270-330");
hold off;

%% ELLIPS:

%% E1
[b,a]=ellip(5,2,40,[250,350]*2/fs,'stop');
[hE1,wE1] = freqz(b,a,'whole');
fE1 = (wE1/(2*pi))*fs;
%figure, plot(fE1,abs(hE1)),
%title("hE1 - 250-350"),
%xlabel("Hz");
%axis([0 600 -0.5 2]);
yE5a = filter(b,a,frase);
soundsc(yE5a,fs);

%% E2
[b,a] = ellip(4, 1, 50, [250,350]*2/fs, 'stop');
[hE2,wE2] = freqz(b,a,'whole');
fE2 = (wE2/(2*pi))*fs;
%figure, plot(fE2,abs(hE2)),
%title("hE2 - 250-350"),
%xlabel("Hz");
%axis([0 600 -0.5 2]);
yE4a = filter(b,a,frase);
soundsc(yE4a,fs);

%% E3
[b,a] = ellip(2, 1, 50, [270,330]*2/fs, 'stop');
[hE3,wE3] = freqz(b,a,'whole');
fE3 = (wE3/(2*pi))*fs;
%figure, plot(fE3,abs(hE3)),
%title("hE3 - 270-330"),
%xlabel("Hz");
%axis([0 600 -0.5 2]);
yE2a = filter(b, a, frase);
soundsc(yE2a, fs);

% Figure con todos los ELLIP superpuestos
figure, hold on, xlabel("Hz"), axis([0 600 -0.5 4]);
title("Filtros ELLIP");
plot(fE1,abs(hE1));
plot(fE2,abs(hE2));
plot(fE3,abs(hE3));
legend("hE1-250-350 (2-40)", "hE2-250-350 (1-50)", "hE3-270-330 (1-50)");
hold off;

% Figure con todos los filtros juntos
figure, hold on, xlabel("Hz"), axis([0 600 -0.5 2]);
title("BUTTER y ELLIP");

plot(fB1,abs(hB1));
plot(fB2,abs(hB2));
plot(fB3,abs(hB3));
plot(fB4,abs(hB4));
plot(fB5,abs(hB5));
plot(fE1,abs(hE1));
plot(fE2,abs(hE2));
plot(fE3,abs(hE3));

N = length(frase); f = (0:N-1)*fs/N;
H = (f < 290) | ((f > 310) & (f < (fs-310))) | (f > (fs-290));
plot(f, H),

legend("hB1-290-310", "hB2-250-350", "hB3-250-350", "hB4-290-310", "hB5-270-330", "hE1-250-350 (2-40)", "hE2-250-350 (1-50)", "hE3-270-330 (1-50)", "Manual");
hold off;