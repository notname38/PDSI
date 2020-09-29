% Ejercicio 2

% Rangos:
n = -1:16;

% Armonicos:
k1 = 4;
k2 = 5;
k3 = 11;

% Exponencial Complejas:
figure;
sk = exp(1j*2*pi*k1/15.*n);
subplot(1,2,1); plot(n ,real(sk), 'g',n,imag(sk), 'r'); title('Armonico de 4, Real.')

sk = exp(1j*2*pi*k2/15.*n);
subplot(3,1,2); plot(n ,real(sk), 'g',n,imag(sk), 'r'); title('Armonico de 5')


%{ Esta exponencial compleja es incorrecta
sk = exp(1j*2*pi*k3/15.*n);
subplot(3,1,3); plot(n ,real(sk), 'g',n,imag(sk), 'r'); title('Armonico de 11')
}%


