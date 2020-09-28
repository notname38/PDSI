% Ejercicio 1

%{
- sin(2*pi*(N/M)*n) = cos(2*pi*(N/M)*n-(pi/2)) para la segunda sinusoidal
- cos(2*pi*n+alfa)=cos(alfa)  para la tercera sinusiodal
%}

% Rangos:
n1 = -10:20;
n2 = -10:0;
n3 = 0:50;
n4 = 0:50;
n5 = -10:10;

% Impulsos:
x1 = 0.8.*(n1-5==0);
x2 = 5.4.*(n2+7==0);

% Sinuisoidales:
s1 = 1*cos(2*pi*15/23*n3 + 0);
s2 = 1*cos(2*pi*1/34*n4 - pi/2);
s3 = 0.8*cos(2*pi*3/2*n5 + (pi/2));

% Plots:
figure(1);
subplot(2,1,1); stem(n1,x1); title('x1 = 0.8*\delta(n+5)')
subplot(2,1,2); stem(n2,x2); title('x2 = 5.4*\delta(n-7)')

figure(2);
subplot(3,1,1); plot(n3,s1); title("s1 = 1*cos(2*pi*15/23*n + 0);")
subplot(3,1,2); plot(n4,s2); title("s2 = 1*cos(2*pi*1/34*n - pi/2);")
subplot(3,1,3); plot(n5,s3); title("s3 = 0.8*cos(2*pi*3/2*n + (pi/2));")


