function s = gendtmf(strTel)
% strTel: cadena de caracteres conteniendo los digitos del número de teléfono

fs=8000;
s=[];
t=0:1/fs:0.085;
for k=1:length(strTel)
   switch strTel(k)
   case '1',      f1=697; f2=1209;
   case '2',      f1=697; f2=1336;
   case '3',      f1=697; f2=1477;
   case '4',      f1=770; f2=1209;
   case '5',      f1=770; f2=1336;
   case '6',      f1=770; f2=1477;
   case '7',      f1=852; f2=1209;
   case '8',      f1=852; f2=1336;
   case '9',      f1=852; f2=1477;
   case '0',      f1=941; f2=1336;
   end
   s= [s 0.5*sin(2*pi*f1*t)+0.5*sin(2*pi*f2*t) zeros(1,fs*.200)];
end
soundsc(s, fs)