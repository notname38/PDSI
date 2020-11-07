function MA = mascara(tam, Fc, tipo)
M = tam(1);
N = tam(2);
MA = zeros(M, N);
[m, n] = ndgrid(ceil(-M/2):ceil(M/2-1), ceil(-N/2):ceil(N/2-1));
Fm = m/M;
Fn = n/N;
if tipo=='bajo'
   MA = sqrt(Fm.^2+Fn.^2)<Fc;
elseif tipo=='alto'
   MA = sqrt(Fm.^2+Fn.^2)>Fc;
end
   
      