function [XF, F] = dtft(x, ni, nF)
% DTFT Transformada de Fourier en Tiempo Discreto
%   [XF,F] = DTFT(x,ni,nf) devuelve en XF la DTFT de la señal finita x
%   evaluada en nF frecuencias equiespaciadas en el rango 0-1, suponiendo
%   que el primer elemento de x corresponde al instante ni.
%                ni+length(n)-1
%       X(F) =       sum  x(n)*exp(-j*2*pi*F*n)
%                    n=ni
%   Ademas devuelve en F las nF frecuencias en que se evalua la DTFT.
%   Tambien muestra en una figura la señal X y su espectro en magnitud y fase.

n = ni:(ni+length(x)-1);
F = (0:(nF-1))/nF;
for i=1:nF
   XF(i) = sum(x .* exp(-j*2*pi*F(i)*n));
end
figure
subplot(3, 1, 1), plot(n, x,'bo:'),grid , title('x(n)'), xlabel('n (muestras)'), ylabel('x(n)')
subplot(3, 1, 2), plot(F, abs(XF)),grid , title('abs(X(F))'), xlabel('F(c/m)'), ylabel('Magnitud')
subplot(3, 1, 3), plot(F, unwrap(angle(XF))),grid , title('angle(X(F))'), xlabel('F(c/m)'), ylabel('Fase')
end

