# 1. Create digital data of sinusoidal waves of different frequencies, plot and play

[f,freq]=audioread('test.wav');
len =length(f)/freq;
x=linspace(0,len,length(f));
F=fft(f(:,1));
Fshift=fftshift(F);
a =1 ;
df=freq/length(F);
x1=-freq/2:df:freq/2-df;

for i =9:10
  y = a*sin(2*pi*i*freq*x);
  plot(x,y) # in time domain
  sound(y,freq)
  hold on
end
for i =9:10
  dfi=i*freq/length(F);
  xi=-i*freq/2:dfi:i*freq/2-dfi;
  plot(xi,abs(Fshift)) #in frequency domain
  hold on
end
# 2. Induce noise to signal
noise = a*sin(2*pi*7*freq*x);
noisy = f + noise';
sound(noisy, freq);
plot(x, noisy)

# 3. Eliminate noise
F2shift=fftshift(fft(noisy));
filter= abs(x1) >900;
plot(x1,filter);
filtered = ifft(ifftshift(F2shift.*filter'));
plot(x1,abs(F2shift.*filter')(:,1)); #frequency domain
plot(x,filtered) #time domain
sound(filtered, freq);
