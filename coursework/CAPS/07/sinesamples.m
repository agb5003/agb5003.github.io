clear
clc
clf

[f,freq]=audioread('test.wav');
len =length(f)/freq; % len is length of the audio file in seconds
t=linspace(0,len,length(f)); % create row vector containing of the total number of samples, spaced between 0 and length, basically creating a timeline
F=fft(f); % Fourier transforms the wave
Fshift=fftshift(F); % Shift F so that zero frequency component is at the center
a =1 ; % Amplitude
df=freq/length(F); % sampling rate divided by total samples
x1=-freq/2:df:freq/2-df;

for i =1:10
dfi=i*freq/length(F);
xi=-i*freq/2:dfi:i*freq/2-dfi;
plot(xi,abs(Fshift)) #in frequency domain
hold on
end
