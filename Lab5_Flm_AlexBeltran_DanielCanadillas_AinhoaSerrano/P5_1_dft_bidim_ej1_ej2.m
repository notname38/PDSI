[m, n] = ndgrid(0:255, 0:255);

x1 = (1/24) * rem(3*m+3*n,25);
x2 = (m < 25 & n < 25);

% DFT sin desplazamiento
X1 = fft2(x1);
X2 = fft2(x2);

% DFT con desplazamiento
X1s = fftshift(X1);
X2s = fftshift(X2);

% DFT en db
X1db = 20*log10(abs(X1s));
X2db = 20*log10(abs(X2s));

% plot x1
figure;
subplot(2,2,1);
imshow(abs(X1),[]),axis on;
title('DFT x1 (abs)');
subplot(2,2,2);
imshow(angle(X1),[]);
title('DFT x1 (angle)');
subplot(2,2,3);
imshow(abs(X1s),[]),axis on;
title('DFT x1 con desplazamiento');
subplot(2,2,4);
x1dbmax = max(X1db(:));
imshow(X1db,[x1dbmax-60 x1dbmax]),axis on;
title('DFT x1 con desplazamiento (db)');

% plot x2
figure;
subplot(2,2,1);
imshow(abs(X2),[]),axis on;
title('DFT x2 (abs)');
subplot(2,2,2);
imshow(angle(X2),[]);
title('DFT x2 (angle)');
subplot(2,2,3);
imshow(abs(X2s),[]),axis on;
title('DFT x2 con desplazamiento');
subplot(2,2,4);
x2dbmax = max(X2db(:));
imshow(X2db,[x2dbmax-60 x2dbmax]),axis on;
title('DFT x2 con desplazamiento (db)');

% Frecuencia fundamental X1
% Al estar shifteado el centro se encuentra en (129,129)
% El punto que se corresponde a la frecuencia fundamental se encuentra en
% el (160,160)
% Por lo que (160-129,160-129) = (31,31) -> (32,32)
% La frecuencia fundamental para ambos componentes se calcularia como
F_x1 = 31/256; % Aproximadamente 3/25 Hz

% Armónicos
%(190,190)
%(190-129,190-129)
F_x1_1 = 61/256;

% (231,231)
% (231-129,231-129)
F_x2_2 = 102/256;

% (221,221)
% (221-129,221-129)
F_x2_3 = 92/256;


% ----------------- Ejercicio 2 -----------------------
X = imread('arboles.jpg');
XX = fft2(X);
XXs = fftshift(XX);
XXdb = 20*log10(abs(XXs));


figure;
subplot(2,2,1);
imshow(abs(XX),[]),axis on;
title('DFT(abs)');
subplot(2,2,2);
imshow(angle(XX),[]);
title('DFT (angle)');
subplot(2,2,3);
imshow(abs(XXs),[]),axis on;
title('DFT con desplazamiento');
subplot(2,2,4);
xdbmax = max(XXdb(:));
imshow(XXdb,[xdbmax-60 xdbmax]),axis on;
title('DFT con desplazamiento (db)');

X = imread('vias.jpg');
XX = fft2(X);
XXs = fftshift(XX);
XXdb = 20*log10(abs(XXs));


figure;
subplot(2,2,1);
imshow(abs(XX),[]),axis on;
title('DFT(abs)');
subplot(2,2,2);
imshow(angle(XX),[]);
title('DFT (angle)');
subplot(2,2,3);
imshow(abs(XXs),[]),axis on;
title('DFT con desplazamiento');
subplot(2,2,4);
xdbmax = max(XXdb(:));
imshow(XXdb,[xdbmax-60 xdbmax]),axis on;
title('DFT con desplazamiento (db)');



