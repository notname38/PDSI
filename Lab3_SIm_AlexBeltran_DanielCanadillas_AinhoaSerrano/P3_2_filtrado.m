clear all; close all; clc;
%% CARRETERAS
%% Carreteras y sobel
[I0] = imread('carretera00.jpg');
[I1] = imread('carretera01.jpg');
[I2] = imread('carretera02.jpg');
SOBEL=double(fspecial('sobel'));

% transformamos en tonos de grises
I0=rgb2gray(I0); 
I1=rgb2gray(I1); 
I2=rgb2gray(I2); 

% Sobel
% bordes horizontales (H)
IH0=imfilter(I0,SOBEL); 
IH1=imfilter(I1,SOBEL); 
IH2=imfilter(I2,SOBEL); 

% bordes verticales (V)
IV0=imfilter(I0,SOBEL'); 
IV1=imfilter(I1,SOBEL'); 
IV2=imfilter(I2,SOBEL'); 

% bordes Sobel (H+V)
IS0=imadd(IH0,IV0); 
IS1=imadd(IH1,IV1);
IS2=imadd(IH2,IV2);

% Visualizacion.
figure,
("Carretera 9");
subplot(2,2,1),subimage(I0),title('Imagen Original');
subplot(2,2,2),subimage(IH0),title('Sobel Horizontal');
subplot(2,2,3),subimage(IV0),title('Sobel Vertical');
subplot(2,2,4),subimage(IS0),title('Sobel');

figure,
subplot(2,2,1),subimage(I1),title('Imagen Original');
subplot(2,2,2),subimage(IH1),title('Sobel Horizontal');
subplot(2,2,3),subimage(IV1),title('Sobel Vertical');
subplot(2,2,4),subimage(IS1),title('Sobel');

figure,
subplot(2,2,1),subimage(I2),title('Imagen Original');
subplot(2,2,2),subimage(IH2),title('Sobel Horizontal');
subplot(2,2,3),subimage(IV2),title('Sobel Vertical');
subplot(2,2,4),subimage(IS2),title('Sobel');

%% BOTELLAS DE LECHE
%% Botella leche - Estimacion nivel de llenado
%%% Tunear: umbral MAX
 
[X, pal] = imread('bot12.jpeg');
figure, image(X), title('orig'); %Imagen original
 
Xg=rgb2gray(X); %Imagen graylevel
figure, image(Xg), title('gray'), colorbar;
 
UMBRAL=double(median(median(Xg))*0.70)/255; %ESTIMACION UMBRAL
Xb=uint8(im2bw(X,UMBRAL)); %Imagen binaria umbralizada
figure, image(Xb,'CDataMapping','scaled'), title('bin'), colorbar;
 
% Calculo histograma sobre imagen umbralizada
histv = sum(Xb, 2);   
high= 700;  % LIMITE superior preestablecido
low = 1000; % LIMITE inferior preestablecido
% calculo del maximo en la derivada del histograma en el intervalo [high-low]
histvd = [diff(histv); 0]; % derivada del histograma
[maxi imax] = min(histvd(high:low)); % Minimo de la derivada
 
figure, plot(histv, 1:size(X,1), 'k'), title('deriv'), set(gca,'YDir','reverse');
hold on;
line([1 max(histv)],[high high],'LineWidth',2,'Color','green');
line([1 max(histv)],[low low],'LineWidth',2,'Color','red');
line([1 max(histv)],[imax+high imax+high],'LineWidth',2,'Color','blue');
hold off;
 
% valor absoluto de la derivada
figure, plot(abs(histvd),1:size(X,1),'m'), title('abs(deriv2)'),set(gca,'YDir','reverse'); %derivada
 
 
% Figura final con las cuatro imagenes
figure,
subplot(2,2,1),image(X),title('Imagen Original');
line([1 size(X,2)],[high high],'LineWidth',2,'Color','green');
line([1 size(X,2)],[low low],'LineWidth',2,'Color','red');
line([1 size(X,2)],[imax+high imax+high],'LineWidth',2,'Color','blue');
 
subplot(2,2,2),image(Xg),title('Imagen Graylevel');
hold on;
line([1 size(X,2)],[high high],'LineWidth',2,'Color','green');
line([1 size(X,2)],[low low],'LineWidth',2,'Color','red');
line([1 size(X,2)],[imax+high imax+high],'LineWidth',2,'Color','blue');
hold off;
 
subplot(2,2,3),image(Xb,'CDataMapping','scaled'),title('Imagen Umbralizada');
hold on;
line([1 size(X,2)],[high high],'LineWidth',2,'Color','green');
line([1 size(X,2)],[low low],'LineWidth',2,'Color','red');
line([1 size(X,2)],[imax+high imax+high],'LineWidth',2,'Color','blue');
hold off;
 
subplot(2,2,4),plot(histv,1:size(X,1),'m'), title('Histogramv'); set(gca,'YDir','reverse');
hold on;
line([1 max(histv)],[high high],'LineWidth',2,'Color','green');
line([1 max(histv)],[low low],'LineWidth',2,'Color','red');
line([1 max(histv)],[imax+high imax+high],'LineWidth',2,'Color','blue');
hold off;
