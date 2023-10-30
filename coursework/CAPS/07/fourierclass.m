clear
clc
clf

[f, freq] = audioread("test.wav");
len = length(f)/freq;
x = linspace(0,len,length(f));

F = fft(f(:,1));
df = freq/length(F);
xi = -freq/2:df:freq/2-df;

Fshift = fftshift(F);
plot(xi,abs(Fshift))
xlabel("Frequency")
ylabel("Absolute Amplitude")

f2=f+0.5*randn(size(f));
% plot(x, f2);
hold on
% plot(x,f,"r");

F2shift = fftshift(fft(f2));
plot(xi, abs(F2shift), 'b');
plot(xi, abs(Fshift), 'r');

filter = abs(xi) < 4000;
plot(xi, filter);

f2filtered = ifft(ifftshift(F2shift.*filter'));
plot(xi,abs(F2shift.*filter')(:,1));
sound(f2filtered,freq)

