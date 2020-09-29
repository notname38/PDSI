Nmin = 11;			% Rango de periodos posibles
Nmax = 88;
WIDTH = 200;		% Nº de puntos de cada fragmento

melo = audioread('melodia.wav');			% carga de la señal de sonido
nfrag = fix( length(melo)/WIDTH );		% calculo de nº de fragmentos

% Obtención de las frecuencias fundamentales en el vector f0 de nfrag
% elementos














% Dibujo del resultado
figure
plot(f0)
drawnow

% Generación de la melodía correspondiente
fase_ini=0;;
mus=[];
for k=1:nfrag ;
   fase=2*pi*f0(k)*(1:WIDTH)/11025 + fase_ini;
   mus=[mus sin(fase)];
   fase_ini=fase(end);
end
soundsc(mus, 11025)
