load ej1
 
%%h1
figure, subplot(1,3,1), plot(x,'.:'), title('x(n)'), xlabel('n');
subplot(1,3,2), plot(h1,'r.:'), title('h1(n)/paso-bajo'), xlabel('n');
y1=conv(x,h1); 
subplot(1,3,3), plot(y1,'m.:'), title('y1(n)'), xlabel('n');
 
X=fft(x,128); H1=fft(h1,128); Y1=fft(y1,128); 
F=(0:127)/128;
 
figure, subplot(1,3,1), plot(F,abs(X),'.:'), title('X(F)'), xlabel('Frec.(c/m)'), ylabel('Magnitud');
subplot(1,3,2), plot(F,abs(H1),'r.:'), title('H1(F)/paso-bajo'), xlabel('Frec.(c/m)'), ylabel('Magnitud');
subplot(1,3,3), plot(F,abs(Y1),'m.:'), title('Y1(F)'), xlabel('Frec.(c/m)'), ylabel('Magnitud');
 
%%h2
figure, subplot(1,3,1), plot(x,'.:'), title('x(n)'), xlabel('n');
subplot(1,3,2), plot(h2,'r.:'), title('h2(n)/paso-alto'), xlabel('n');
y2=conv(x,h2); 
subplot(1,3,3), plot(y2,'m.:'), title('y2(n)'), xlabel('n');
 
H2=fft(h2,128); Y2=fft(y2,128); 
 
figure, subplot(1,3,1), plot(F,abs(X),'.:'), title('X(F)'), xlabel('Frec.(c/m)'), ylabel('Magnitud');
subplot(1,3,2), plot(F,abs(H2),'r.:'), title('H2(F)/paso-alto'), xlabel('Frec.(c/m)'), ylabel('Magnitud');
subplot(1,3,3), plot(F,abs(Y2),'m.:'), title('Y2(F)'), xlabel('Frec.(c/m)'), ylabel('Magnitud');
 
%%h3
 
figure, subplot(1,3,1), plot(x,'.:'), title('x(n)'), xlabel('n');
subplot(1,3,2), plot(h3,'r.:'), title('h3(n)/filtro-atenuador-inversor'), xlabel('n');
y3=conv(x,h3); 
subplot(1,3,3), plot(y3,'m.:'), title('y3(n)'), xlabel('n');

H3=fft(h3,128); Y3=fft(y3,128); 
 
figure, subplot(1,3,1), plot(F,abs(X),'.:'), title('X(F)'), xlabel('Frec.(c/m)'), ylabel('Magnitud');
subplot(1,3,2), plot(F,abs(H3),'r.:'), title('H3(F)/filtro-atenuador-inversor'), xlabel('Frec.(c/m)'), ylabel('Magnitud');
subplot(1,3,3), plot(F,abs(Y3),'m.:'), title('Y3(F)'), xlabel('Frec.(c/m)'), ylabel('Magnitud');
 
%%h4
 
figure, subplot(1,3,1), plot(x,'.:'), title('x(n)'), xlabel('n');
subplot(1,3,2), plot(h4,'r.:'), title('h4(n)/filtro-derivador-discreto'), xlabel('n');
y4=conv(x,h4); 
subplot(1,3,3), plot(y4,'m.:'), title('y4(n)'), xlabel('n');
 
H4=fft(h4,128); Y4=fft(y4,128); 
 
figure, subplot(1,3,1), plot(F,abs(X),'.:'), title('X(F)'), xlabel('Frec.(c/m)'), ylabel('Magnitud');
subplot(1,3,2), plot(F,abs(H4),'r.:'), title('H4(F)/filtro-derivador-discreto'), xlabel('Frec.(c/m)'), ylabel('Magnitud');
subplot(1,3,3), plot(F,abs(Y4),'m.:'), title('Y4(F)'), xlabel('Frec.(c/m)'), ylabel('Magnitud');

