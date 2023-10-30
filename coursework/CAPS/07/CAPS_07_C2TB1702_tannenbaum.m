clear
clc
figure(1)
clf
movegui(1, "west");
figure(2)
clf
movegui(2, "north");
figure(3)
clf
movegui(3, "south");
figure(4)
clf
movegui(4, "northeast");
figure(5)
clf
movegui(5, "southeast");

% Define the sample frequency of the sound
sampleRate = 44100; % Using standard CD quality sample frequency
sampleLength = 1/sampleRate; % Length of time the sample is held for

% Import audio file
[f,freq] = audioread("tannenbaum.wav");

% Total number of samples in the whole duration
samples = length(f); % Make length of noise equal to length of audio file

sampleSpace = [0:samples-1]; % Creates a space for t to draw from
t = sampleLength*sampleSpace;

% Plot the audio file with time domain
figure(1)
plot(t, f, 'g')
title("Time domain plot of tannenbaum audio file");
xlabel("Time (s)");
ylabel("Amplitude");

tannenbaumFourier = fft(f); % Apply Fourier transform to our tannenbaum file
tannenbaumFourierShift = fftshift(tannenbaumFourier); % Shift to center 0 freqs
df = sampleRate / samples; % Create step for xsin array
xdomain = -sampleRate/2:df:sampleRate/2-df; % Create domain

figure(2) % Apply following lines to figure(2) only
plot(xdomain, abs(tannenbaumFourierShift), 'g') % Plot in freq domain
title("Fourier plot of tannenbaum audio file")
axis([-5000 5000 -500 15000]);
xlabel("Frequency (Hz)");
ylabel("Samples");

% Play original audio file
printf("Currently Playing Original Audio File\n")
sound(f, sampleRate)

% Creating noise
fsin = 440; % We choose 440 Hz for noise
amplitude = 0.2; % Amplitude of the wave, this time lowered so we can hear audio

sinWave = amplitude*sin(2*pi*fsin*t); % Define the sine wave

% Add noise to audiofile
noisy = f + sinWave';

% Plot the resulting sound with time domain
figure(1)
plot(t, noisy, 'g') % Plot noisy sound
title("Time domain plot of noisy audio file");
xlabel("Time (s)");
ylabel("Amplitude");

noisyFourier = fft(noisy); % Apply Fourier transform to our noisy sound
noisyFourierShift = fftshift(noisyFourier); % Shift so 0 frequencies are centered
df = sampleRate / samples; % Create step for xsin array
xdomain = -sampleRate/2:df:sampleRate/2-df; % Create domain

figure(2) % Apply following lines to figure(2) only
plot(xdomain, abs(noisyFourierShift), 'g') % Plot in freq domain
title("Fourier plot of noisy audio file")
xlabel("Frequency (Hz)");
ylabel("Samples");

% Play the noisy audio file
clc
printf("Currently Playing Noisy Audio File\n")
sound(noisy, sampleRate)
audiowrite("noisy-tannenbaum.wav", noisy, sampleRate)

% Remove noise
filterOut = abs(xdomain) > 400 & abs(xdomain) < 450; % Select frequencies to del
keepFrequencies = ~filterOut;

% Plot the logical filtering gate
figure(3)
plot(xdomain, keepFrequencies)
title("Fourier plot of the logical gate for the filtering. 1 means the frequency components are kept")
xlabel("Frequency (Hz)")
axis([-600 600 -0.5 1.5])

% Cancel noise frequencies according to defined filter
noiseCancelled = ifft(ifftshift(noisyFourierShift.*keepFrequencies'));

% Plot the noise cancelled signal in time domain
figure(4)
plot(t, noiseCancelled, 'c');
title("Time domain plot for noise cancelled signal");
xlabel("Time (s)");
ylabel("Amplitude");

% Plot the noise cancelled signal in frequency domain
figure(5)
noiseCancelledFourier = fft(noiseCancelled); % Apply Fourier transform
noiseCancelledFourierShift = fftshift(noiseCancelledFourier);
plot(xdomain, abs(noiseCancelledFourierShift), 'c');
title("Fourier plot of noise cancelled audio file");
axis([-5000 5000 -500 15000]);
xlabel("Frequency (Hz)");
ylabel("Samples");

% Play the noise cancelled signal
clc
printf("Currently Playing Noise Cancelled Audio File\n")
sound(noiseCancelled, sampleRate);

% Save it to a .wav file
audiowrite("tannenbaum-noisecancelled.wav", noiseCancelled, sampleRate);

