%%% Botella leche - Estimacion nivel de llenado
%%% Tunear: umbral MAX
clear all; close all; clc;

[X, pal] = imread('bot13.jpeg');
figure, image(X), title('orig'); %Imagen original

Xg=rgb2gray(X); %Imagen graylevel
figure, image(Xg), title('gray'), colorbar;

UMBRAL=double(max(max(Xg))*0.70)/255; %ESTIMACION UMBRAL
Xb=uint8(im2bw(X,UMBRAL)); %Imagen binaria umbralizada
figure, image(Xb,'CDataMapping','scaled'), title('bin'), colorbar;

% Calculo histograma sobre imagen umbralizada
histv = sum(Xb, 2);   
high= 700;  % LIMITE superior prestablecido
low = 1000; % LIMITE inferior prestablecido
% calculo del mínimo en la derivada del histograma en el intervalo [high-low]
histvd = [diff(histv); 0]; % derivada del histograma
[mini imin] = min(histvd(high:low)); % MAXIMO de la derivada

figure, plot(histv, 1:size(X,1), 'k'), title('deriv'), set(gca,'YDir','reverse');
hold on;
line([1 max(histv)],[high high],'LineWidth',2,'Color','green');
line([1 max(histv)],[low low],'LineWidth',2,'Color','red');
line([1 max(histv)],[imin+high imin+high],'LineWidth',2,'Color','blue');
hold off;

% valor absoluto de la derivada
figure, plot(abs(histvd),1:size(X,1),'m'), title('abs(deriv2)'),set(gca,'YDir','reverse'); %derivada


% Figura final con las cuatro imagenes
figure,
subplot(2,2,1),image(X),title('Imagen Original');
line([1 size(X,2)],[high high],'LineWidth',2,'Color','green');
line([1 size(X,2)],[low low],'LineWidth',2,'Color','red');
line([1 size(X,2)],[imin+high imin+high],'LineWidth',2,'Color','blue');

subplot(2,2,2),image(Xg),title('Imagen Graylevel');
hold on;
line([1 size(X,2)],[high high],'LineWidth',2,'Color','green');
line([1 size(X,2)],[low low],'LineWidth',2,'Color','red');
line([1 size(X,2)],[imin+high imin+high],'LineWidth',2,'Color','blue');
hold off;

subplot(2,2,3),image(Xb,'CDataMapping','scaled'),title('Imagen Umbralizada');
hold on;
line([1 size(X,2)],[high high],'LineWidth',2,'Color','green');
line([1 size(X,2)],[low low],'LineWidth',2,'Color','red');
line([1 size(X,2)],[imin+high imin+high],'LineWidth',2,'Color','blue');
hold off;

subplot(2,2,4),plot(histv,1:size(X,1),'m'), title('Histogramv'); set(gca,'YDir','reverse');
hold on;
line([1 max(histv)],[high high],'LineWidth',2,'Color','green');
line([1 max(histv)],[low low],'LineWidth',2,'Color','red');
line([1 max(histv)],[imin+high imin+high],'LineWidth',2,'Color','blue');
hold off;


