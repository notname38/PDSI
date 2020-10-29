function fftevol(x,NVent,NDesp,fs)
figure
iii = 1:NVent;
f = (0:NVent-1)/NVent*fs;
while iii(NVent)<=length(x)
   subplot(2,1,1),plot(x(iii)),axis([0 NVent -1 1]);
   title('Fragmento senal original');xlabel('Muestras');
   espectro = fft(x(iii).*hanning(NVent));
   espectro = abs(espectro);
   subplot(2,1,2),plot(f,espectro);
   title('Espectro de magnitud');xlabel('Frecuencia c/s');
   drawnow
   iii = iii + NDesp;pause

end
