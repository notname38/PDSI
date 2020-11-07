clc; clear all; close all;
[arbol] = imread('arboles.jpg');
fftArbol = fft2(arbol);
X = fftshift(fftArbol);
Xdb = 20*log10(abs(X));
dbmax = max(Xdb(:));


%% Eliminar Por encima de 0.1
M = mascara(size(X), 0.1, 'bajo');
Xf = M.*X;
xf = uint8(real(ifft2(ifftshift(Xf))));
figure, 
subplot (2,2,1), imshow(arbol), title("Original.");
subplot (2,2,2), imshow(Xdb, [dbmax-60, dbmax]), title("Espectro.");
subplot (2,2,3), imshow(M), title("Mascara.");
subplot (2,2,4), imshow(xf), title("Eliminar por encima de 0.1");

%% Eliminar Por debajo de 0.1
M = mascara(size(X), 0.1, 'alto');
Xf = M.*X;
xf = uint8(real(ifft2(ifftshift(Xf))));
figure, 
subplot (2,2,1), imshow(arbol), title("Original.");
subplot (2,2,2), imshow(Xdb, [dbmax-60, dbmax]), title("Espectro.");
subplot (2,2,3), imshow(M), title("Mascara.");
subplot (2,2,4), imshow(xf), title("Eliminar por debajo de 0.1");

%% Eliminar fuera de 0.05 y 0.1
M1 = mascara(size(X), 0.05, 'alto'); % Quitamos por debajo de 0.05
Xf = M1.*X;
M2 = mascara(size(X), 0.1, 'bajo'); % Quitamos por encima de 0.1
Xf = M2.*Xf;
xf = uint8(real(ifft2(ifftshift(Xf))));
figure, 
subplot (2,2,1), imshow(arbol), title("Original.");
subplot (2,2,2), imshow(Xdb, [dbmax-60, dbmax]), title("Espectro.");
subplot (2,2,3), imshow(M1.*M2), title("Mascara.");
subplot (2,2,4), imshow(xf), title("Eliminar todo excepto entre 0.05 y 0.1");