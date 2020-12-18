
% Crea los dos vectores a y b que representen el sistema
a = [ 1 0 1.6 0 1 0 0.2 ];
b = [ 0.05 0 -1 0 1 0 -1];

% Calcula y dibuja su respuesta a impulso h(n) 
nn = 0:127;
d = (nn==0);
h = filter(b,a,d);
figure;
plot(nn, d, 'o', nn, h, '.r');


% Calcula y dibuja la respuesta en frecuencia H(F)
H = fft(h, 512);
figure;
plot(abs(H)),grid;
title('Espectro de magnitud H(F)');

% Dibuja el diagrama de polos y ceros
z = roots(b);
p = roots(a);
g = b(1) / a(1);
figure;
zplane(b,a); % Es estable

%-------------

% la señal de entrada, x
nn = 0:127;
xn = cos(2*pi*0.1*nn) + cos(2*pi*0.25*nn) + cos(2*pi*0.4*nn);
figure;
plot(nn,xn);
title("Señal de entrada x");

% Utilizando esa señal como entrada calcula la salida del filtro utilizando la función filter
y = filter(b,a,xn);
figure, plot(nn, y), title('Señal de salida');

% Calcula (y dibuja) el espectro de magnitud de:
X = fft(xn,128);
figure;
plot(nn/128,abs(X));
title("Espectro de maginitud X(F)");

[H, W] = freqz(b, a, 128, 'whole');
F = W/(2*pi);
figure;
title('Espectro de magnitud H(F)'),plot(F,abs(H)),grid;

Y = X.*H';
figure;
plot(nn/128,abs(Y)),title('Espectro de magnitud Y(F)'),grid;



