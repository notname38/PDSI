function  y = gencos (A, F, fi, ni, nf)
%gencos 	genera una sinusoidal: A*cos(2*pi*F*n + fi)
%	uso:	y = gencos (A, F, fi, ni, nf)
%	A	amplitud
%	F	frecuencia en ciclos por muestra
%	fi	desfase
%	ni	valor inicial del indice
%	nf	valor final del indice
%	y	senal de salida


nn = ni:nf;
y = A*cos(2*pi*F*nn + fi);
