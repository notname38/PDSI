% Exponenciales Complejas
n = -2:16;
sk_4 = exp(1j*2*pi*4/15*n);
sk_5 = exp(1j*2*pi*5/15*n);
sk_11 = exp(1j*2*pi*11/15*n);

figure;
subplot(3,1,1);
plot(n,real(sk_4));
title('s_4(n)');
subplot(3,1,2);
plot(n,real(sk_5));
title('s_5(n)');
subplot(3,1,3);
plot(n,real(sk_11));
title('s_{11}(n)');
sgtitle({'Parte real';'';'$s_k(n)=e^{j\frac{2\pi k}{15}n}$'},'interpreter','latex');

figure;
subplot(3,1,1);
plot(n,imag(sk_4),'r');
title('s_4(n)');
subplot(3,1,2);
plot(n,imag(sk_5),'r');
title('s_5(n)');
subplot(3,1,3);
plot(n,imag(sk_11),'r');
title('s_{11}(n)');
sgtitle({'Parte imaginaria';'';'$s_k(n)=e^{j\frac{2\pi k}{15}n}$'},'interpreter','latex');