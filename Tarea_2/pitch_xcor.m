Nmin = 11;			% Rango de periodos posibles
Nmax = 88;
WIDTH = 200;		% N� de puntos de cada fragmento

melo = audioread('melodia.wav');			% carga de la se�al de sonido
nfrag = fix( length(melo)/WIDTH );		% calculo de n� de fragmentos

% Obtenci�n de las frecuencias fundamentales en el vector f0 de nfrag
% elementos














% Dibujo del resultado
figure
plot(f0)
drawnow

% Generaci�n de la melod�a correspondiente
fase_ini=0;;
mus=[];
for k=1:nfrag ;
   fase=2*pi*f0(k)*(1:WIDTH)/11025 + fase_ini;
   mus=[mus sin(fase)];
   fase_ini=fase(end);
end
soundsc(mus, 11025)
