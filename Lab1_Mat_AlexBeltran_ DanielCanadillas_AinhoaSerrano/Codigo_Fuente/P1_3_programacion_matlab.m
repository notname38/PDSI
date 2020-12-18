% a)
n = 10;
x = (1:n).^2;
y = (1:n).^3;

% b)
%Dado un vector v=-4:15, genera un vector w del mismo tamaño en el que los 
%valores mayores que 2 se sustituyen por -1 y los que son menores o iguales por 5.

v = -4:15;
w = v;
w(v > 2) = -1;
w(v <= 2) = 5;