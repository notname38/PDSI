
clear all, close all, clc;
K = 7;  % factor de interpolado
L = 12;  % factor de diezmado
Nfir = 50;   % orden del filtro FIR (par)

%% 1:
% Leer del fichero cplus44.wav el sonido a descodificar y escucharlo. 
% Dibujar la señal en el tiempo y el espectro de la misma.

[x fs] = audioread("cplus44.wav");
n = length(x); t = (1:n)/fs;
X = fft(x); Frec = (0:n-1)/n;

% Plot:
figure; plot(t,x); title("S. codificada"); xlabel("Tiempo en segundos");
% soundsc(x,fs);  % Descomentar para escuchar el sonido.

% Plot:
figure, plot(Frec,abs(X)); title("Espectro de la s. codificada"); xlabel("Frecuencia");

%% 2: 
% Diseñar un filtro IIR paso bajo con frecuencia de corte 1/12 -> min(0.5/7,0.5/12)*2
h = fir1(Nfir, min(0.5/K,0.5/L)*2);  

%% 3: 
% Cambiar la velocidad de muestreo de la señal (interpolar por 7 y diezmar por 12 utilizando el filtro anterior). 
% Cuidado, hay que compensar el desplazamiento que introduce el filtro fir1 (mitad del orden).

interpol7(1:K:K*length(x)) = x; % interpolar por 7

n = length(interpol7); fftInt7 = fft(interpol7); Frec = (0:n-1)/n;

% Plot:
figure, plot(Frec, abs(fftInt7)),
title("Espectro de la señal intermedia interpolada a 7"),
xlabel("Frecuencia");

convi7 = conv(h, interpol7)*L;
n = length(convi7); fftConvI7 = fft(convi7); Frec = (0:n-1)/n;

% Plot:
figure, plot(Frec, abs(fftConvI7)),
title("Espectro de la señal intermedia convI7 (interpolada filtrada)"),
xlabel("Frecuencia.");

% compensar el desplazamiento introducido por el filtro firl (mitad del orden)
% 50 -> 25 --> >25
convi7 = convi7(26:end);
% diezmar por 12
convi7diezmada = convi7(1:L:end); 

n = length(convi7diezmada);
fftconvi7diezmada = fft(convi7diezmada); Frec = (0:n-1)/n;

% Plot:
figure, plot(Frec, abs(fftconvi7diezmada)),
title("Espectro de la señal intermedia diezmada."),
xlabel("Frecuencia");

%% 4:
% Cambiar el signo de las muestras impares para invertir el espectro.

convi7diezmada(1:2:end) = -convi7diezmada(1:2:end);

fftconvi7diezmada = fft(convi7diezmada);
n = length(fftconvi7diezmada); Frec = (0:n-1)/n;

% Plot.
figure, plot(Frec, abs(fftconvi7diezmada)),
title("Espectro de la señal descodificada a 25735Hz"),
xlabel("Frecuencia");

%% 5:
% Escuchar el resultado (con velocidad de muestreo 25725 Hz).
soundsc(convi7diezmada, 25725); 

%% 6:
% Aumentar la frecuencia de la señal a 44100 Hz. 
% Es el proceso simétrico al realizado en los pasos anteriores.

auxInterpol(1:L:L*length(convi7diezmada)) = convi7diezmada; 
auxInterpol = conv(h, auxInterpol)*L;
auxInterpol = auxInterpol(26:end);
sfinal = auxInterpol(1:K:end); % diezmar por 7
fftFinal = fft(sfinal); n = length(fftFinal); Frec = (0:n-1)/n;

% Plot:
figure, plot(Frec, abs(fftFinal)),
title("Espectro de la señal descodificada a 44100Hz"),
xlabel("Frecuencia");

% Resultado:
soundsc(sfinal, fs); 
