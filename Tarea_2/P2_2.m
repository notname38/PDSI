%% --P2_2 "ESTIMACIÓN DE FRECUENCIA FUNDAMENTAL MEDIANTE CORRELACIÓN"-- 
%% Completar el resto en pitch_xcor.m
%% frecuencia = X muestras / s
%% Si el periodo son 27 muestras, y la frecuencia 11025....
%% Cual es la frecuencia funamental? y Que nota es?
%% Fs/F = (m/s)/m = 1/s = Hz
%% Copiado talcual del profe

[melodia, frecuencia] = audioread('melodia.wav');

correlacion = xcorr(melodia(3000:3199));
plot(correlacion);
grid;
plot(correlacion(211:288),'o'), grid;
[rmax, imax] = max(correlacion(211:288);



