%% Ejercicio 3

%% Codigo:
[arbol] = imread('arboles.jpg');
fftArbol = fft2(arbol);
shiftedArbol = fftshift(fftArbol);
espectro_magnitud = ifft2(ifftshift(abs(shiftedArbol))); 

%% Visualizacion:
figure, 

subplot (1,2,1), imshow(arbol);
title('Original.');

subplot (1,2,2), imshow(uint8(real(espectro_magnitud)));
title('Reconstruido solo espectro-magnitud.');