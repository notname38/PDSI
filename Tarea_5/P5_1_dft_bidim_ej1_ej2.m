
%% Ejercicio 1:
		% calcula y visualiza los espectros de las siguientes imagenes

% a)
[m, n] = ndgrid(0:255, 0:255); 
xA = (1/24) * rem((3*m + 3*n)/25);

figure, imshow(xA), title("X1 Original");

fftxA = fft2(xA);

figure, 
subplot (2,2,1), imshow(abs(fftxA), []), axis on, title("X1 Magnitud.");
subplot (2,2,2), imshow(angle(fftxA), []), title("X1 Fase.");

xxA = fftshift(fftxA);

subplot (2,2,3), imshow(abs(xxA), []), axis on,  title("X1 Centrada.");

xAdb = 20*log10(abs(xxA));
dbmax = max(xAdb(:));

subplot (2,2,4), imshow(Xdb, [dbmax-60, dbmax]), axis on, title("X1 Decibelios");

% b)
[m, n] = ndgrid(0:255, 0:255); 
xB_1 =
[m, n] = ndgrid(0:255, 0:255); 
