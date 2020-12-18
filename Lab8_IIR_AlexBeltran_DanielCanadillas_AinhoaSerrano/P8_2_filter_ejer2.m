%Ejercicio2
%Definición de polinomios
A1 = [1 0 0.25];
%B1 = [1];
%A2 = [1];
B2 = [1 0.5 0.25];
%A3 = [1];
B3 = [0.25 0.5 0.25];
A4 = [1 -0.9 0.81];
B4 = [1 1];
 
%H(Z) = (T1*T2 + T3) * T4
%E/S --> B = (B2 + B3 x A1 ) * B4 / (A1 * A4) 
 
B3A1=conv(B3,A1); %Multiplicación de polinomios
B2B3A1= [B2 0 0]+B3A1; %Se añaden ceros porque tienen que tener la misma longitud
B=conv(B2B3A1,B4);
A=conv(A1,[A4 0 0 0]);
 
%Diagrama de polos y ceros
[hz1, hp1, ht1] =zplane(B,A);
set(findobj(hz1, 'Type', 'line'), 'Color', 'g'); 
set(findobj(hp1, 'Type', 'line'), 'Color', 'b');
set(findobj(ht1, 'Type', 'line'), 'Color', 'k');
%Respuesta a impulso h(n)
nn = 0:50;
d = (nn==0);
h=filter(B,A,d);
figure, plot(nn,d,'o',nn,h,'-r'),title('Respuesta a impulso')
[H,W]=freqz(B,A,'whole');
F=W/(2*pi);
figure,plot(F,abs(H)),title('Respuesta frecuencia - H(Z)')
