function y = tone(f, phi, d, fs)
%tone: 
%	y = tone(f, phi, d, fs)    
%   Frequency: f (Hz) [fundamental note]
%   Phase: phi (rad)
%   Duration: d (s)
%   Sampling rate: fs (samples/s) [default: 22050]
%	tone(f, phi, d, fs) without output parameter generates the sound

if nargin < 3
    fs = 22050;
end

tt = 0:1/fs:d;

s = sin(2*pi*f*tt + phi);

if nargout == 0
   soundsc(s, fs)
else
   y = s;
end
