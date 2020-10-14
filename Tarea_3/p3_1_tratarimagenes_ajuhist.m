function y = ajuhist(x, bmin, bmax)
%AJUHIST transforma imagen monocrmoa modificando histograma.
%		X es una imagen monocroma con tipo uint8
%
%Y = AJUHIST(X) Cambia el brilo de los puntos de la imagen tratando de igualar 
%					 al máximo el histograma.
%
%Y = AJUHIST(X, BMIN, BMAX) Cambia el brilo de los puntos de la imagen de forma 
%       que:
%			Los brillos por debajo de BMIN pasan a ser 0
%			Los brillos por encima de BMAX pasan a ser 255
%			Para valores entre BMIN y BMAX la transformacion es lineal

histx = hist(double(x(:)),0:255);
figure, subplot(3,1,1), plot(histx,'.'), title('Histograma inicial')

switch nargin
   
case 1   % Igualacion automatica
    Ftrans = zeros(1,256);
    
    for i=1:256
        Ftrans(i) = Ftrans(i) + sum(histx(1:i));
    end
    Ftrans = (255/(size(x,1)*size(x,2)))*Ftrans;
    
case 3   % transfomacion lineal con umbrales bmin y bmax
    fint = 255/ (bmax-bmin);
    Ftrans = [zeros(1,bmin) (1:(bmax-bmin))*fint 255*ones(1,(256-bmax))];    
   
otherwise
   error('Nº incorrecto de argumentos');
end

subplot(3,1,2), plot(Ftrans,'.'), title('Función de transformacion')
y = Ftrans(double(x)+1);
histy = hist(y(:),0:255);
subplot(3,1,3), plot(histy,'.'), title('Nuevo histograma')
y = uint8(y);
figure,imshow(y)

%[cam, pal] = imread('camion.bmp'); cam = ind2gray(cam,pal); ajuhist(cam)
%[cam, pal] = imread('camion.bmp'); cam = ind2gray(cam,pal); ajuhist(cam,40,125)

%ajuhist(imread('cameraman.tif'))
%ajuhist(imread('cameraman.tif'),40,125)

%ajuhist(imread('nina.tif'))
%ajuhist(imread('nina.tif'),40,125)

%ajuhist(imread('liftingbody.png'))
%ajuhist(imread('liftingbody.png'),40,125)

%ajuhist(imread('monedas.tif'))
%ajuhist(imread('monedas.tif'),40,125)
