
function y = filtrbf(x,finf,fsup,fs)
% filtro rechazo banda en el dominio de la frecuencia
% y=filtrbf(x,finf,fsup,fs) elimina de la senal x las componentes asociadas 
% al rango de frecuencias comprendido entre finf y fsup en Hz.
% Para ello calcula la DFT de la senal (X(F)) 
% Anula las componentes frecuenciales correspondientes y 
% Obtiene la IDFT para volver al dominio n.

N = length(x);
% Calculamos la DFT
X = fft(x);
f = (0:N-1)'/N*fs;      % vector con frecuencias en Hz de cada valor de la DFT
% Anular los valores dentro de [finf,fsup]
% sin olvidar los elementos simetricamente colocados respecto de F=0.5

mask = (f <= finf) | (f>=fsup);
mask_simetrica = (f <(fs-fsup)) | (f>=(fs -finf)); 

X_n = X .* mask;
X_n_sim = X_n .* mask_simetrica;

figure;
subplot(3,1,1); 
plot(f,x);
title("Señal original");

subplot(3,1,2);
plot(f,abs(X_n));
title("Espectro Amplitud");

subplot(3,1,3);
plot(f,abs(X_n_sim));
title("Espectro Amplitud aplicado simétrico");

% Calculamos la nueva senal filtrada y mediante IDFT

y = real(ifft(X_n_sim));


soundsc(y,fs);


  

