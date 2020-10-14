%% --P2_1 "SÍNTESIS DE SONIDOS Y PERCEPCIÓN"-- 
% Genera las imágenes de las dos señales s1(t) y s2(t) del 
% P2_1_armonicos.m de manera que se visualicen cuatro periodos de 
% manera adecuada, en función del tiempo en muestras y en función 
% del tiempo en segundos.

%% Inicializaciones:
clc; close all;

% n, f y Tiempo
n = 0:10000;
f = 10000;
Tiempo = n / f;

% Rango maximo de visualizacion:
rango_max = 250;

% Armonicos
armonico_1 = 0.5 * cos(2*pi*(220/f)*n) + 0.5 * cos(2*pi*(440/f)*n);
armonico_2 = 0.5 * cos(2*pi*(220/f)*n) + 0.5 * cos(2*pi*(440/f)*n+pi/2);

%% Visualzacion:
figure;

% En funcion de n.
subplot(2,2,1); 
plot(n(1:rango_max), armonico_1(1:rango_max)); title("Armonico 1 en funcion de n");
xlabel("Muestras.");
subplot(2,2,2); 
plot(n(1:rango_max), armonico_2(1:rango_max)); title("Armonico 2 en funcion de n");
xlabel("Muestras.");

% En funcion del tiempo.
subplot(2,2,3); 
plot(Tiempo(1:rango_max), armonico_1(1:rango_max)); title("Armonico 1 en funcion del tiempo");
xlabel("Tiempo en segundos.");
subplot(2,2,4); 
plot(Tiempo(1:rango_max), armonico_2(1:rango_max)); title("Armonico 2 en funcion del tiempo");
xlabel("Tiempo en segundos.");
