Nmin = 11;			% Rango de periodos posibles
Nmax = 88;
WIDTH = 200;		% Nº de puntos de cada fragmento

melo = audioread('melodia.wav');			% carga de la señal de sonido
nfrag = fix( length(melo)/WIDTH );		% calculo de nº de fragmentos

% Obtención de las frecuencias fundamentales en el vector f0 de nfrag
% elementos

fs = 11025;
N0 = size(1:nfrag);
f0 = size(1:nfrag);
for i=1:nfrag
    corr = xcorr(melo(((i-1)*WIDTH)+1:i*WIDTH));
    %plot(corr);
    %pause;
    [rmax imax] = max(corr(WIDTH + 10 : WIDTH+Nmax));
    N0(i) = 10 + imax;
    f0(i) = fs / N0(i);
end

% Dibujo del resultado
figure
plot(f0)
drawnow

% Generación de la melodía correspondiente
fase_ini=0;
mus=[];
for k=1:nfrag
   fase=2*pi*f0(k)*(1:WIDTH)/11025 + fase_ini;
   mus=[mus sin(fase)];
   fase_ini=fase(end);
end
soundsc(mus, 11025)
