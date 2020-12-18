% a) Impulsos

% x1)
rX1 = -10:20;
dX1 = (rX1-5) == 0;
x1 = 0.8 .* dX1;
figure; stem(rX1,x1)
xlabel('-10\leq n \leq 20')
title('x_1(n)= 0.8\delta(n-5)')

% x2)
rX2 = -10:0;
dX2 = (rX2+7) == 0;
x2 = 5.4 .* dX2;
figure; stem(rX2,x2)
xlabel('-10\leq n \leq 0')
title('x_2(n)= 5.4\delta(n+7)')

%b) Sinusoidales
n1 = 0:50;
s1 = cos(2*pi*(15/23)*n1);
figure;
plot(n1,s1);
xlabel('0 \leq n \leq 50');
title('$s_1(n)=cos(\frac{30\pi}{23}n)=cos(2\pi \frac{15}{23}n)$','interpreter','latex');

n2 = 0:50;
s2 = cos((2*pi*1/34)*n2 - pi/2);
figure; plot(n2,s2);
xlabel('0 \leq n \leq 50');
title('$s_2(n)=sin(\frac{\pi}{17}n)=cos(2\pi n\frac{1}{34} - \frac{\pi}{2})$','interpreter','latex');

n3 = -10:10;
s3 = 0.8 * cos(2*pi*(1/2)*n3 + pi/2);
figure; plot(n3,s3);
xlabel('-10 \leq n \leq 10');
title('$s_3(n)=0.8cos(3\pi n + \frac{\pi}{2}) = 0.8cos(2\pi n \frac{1}{2} + \frac{\pi}{2})$','interpreter','latex');