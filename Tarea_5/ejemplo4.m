x = imread('arboles.jpg');
[M N] = size(x);
x(:,3:3:end) = 0;
figure, imshow(x);axis on;

X = fftshift(fft2(x));
Xdb = 20*log10(abs(X));
dbmax = max(Xdb(:));
figure, imshow(Xdb,[dbmax-60 dbmax]), colorbar

MM = mascara(size(X), 0.1,'alto');
desp = round(N/3);
MM = MM(:,[N-desp+1:N 1:N-desp]).*MM(:,[desp+1:N 1:desp]);

Xf = MM.*X;
Xfdb = 20*log10(abs(Xf));
figure, imshow(Xfdb,[dbmax-60 dbmax]), colorbar
xf = uint8(real(ifft2(fftshift(Xf))));
figure, imshow(xf)


