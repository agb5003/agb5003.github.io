clear
clc
figure(1)
clf
movegui(1, "north");
figure(2)
clf
movegui(2, "south");

% Define the sample frequency of the sound
sampleRate = 44100; % Using standard CD quality sample frequency
sampleLength = 1/sampleRate; % Length of time the sample is held for

% Import audio file
[f,freq] = audioread("test.wav");

% Total number of samples in the whole duration
samples = length(f); % Make length of noise equal to length of audio file

sampleSpace = [0:samples-1]; % Creates a space for t to draw from
t = sampleLength*sampleSpace;

% Creating noise
fsin = 440; % We choose 440 Hz for noise
amplitude = 0.2; % Amplitude of the wave, this time lowered so we can hear audio

sinWave = amplitude*sin(2*pi*fsin*t); % Define the sine wave

% Add noise to audiofile
noisy = f + sinWave';

% % Uncomment below lines to change to single plot
% % Plot the resulting sound with time domain
%figure(1)
%plot(t, noisy) % Plot noisy sound
%title("Time domain plot of noisy audio file");
%xlabel("Time (s)");
%ylabel("Amplitude");
%
%noisyFourier = fft(noisy); % Apply Fourier transform to our noisy sound
%noisyFourierShift = fftshift(noisyFourier); % Shift so 0 frequencies are centered
%df = sampleRate / samples; % Create step for xsin array
%xdomain = -sampleRate/2:df:sampleRate/2-df; % Create domain
%
%figure(2) % Apply following lines to figure(2) only
%plot(xdomain, abs(noisyFourierShift)) % Plot in freq domain
%title("Fourier plot of noisy audio file")
%xlabel("Frequency (Hz)");
%ylabel("Samples");

sound(noisy, sampleRate) % Play the sound
audiowrite("noisy.wav", noisy, sampleRate) % Create sound file

% Comment all below lines to change to single plot (select then cmd/ctrl+r)
figure(1)
title("Time domain plot of noisy audio file, separated")
hold on
plot(t, sinWave, "r") % Plot sin wave
plot(t, f, "b")
xlabel("Time (s)");
ylabel("Amplitude");

% For Fourier plot:
sinFourier = fft(sinWave); % Apply Fourier transform to our sine wave
sinFourierShift = fftshift(sinFourier); % Shift so 0 frequencies are centered
df = sampleRate / samples; % Create step for xsin array
xsin = -sampleRate/2:df:sampleRate/2-df; % Create domain

F = fft(f); % Fourier transform the audio file
Fshift = fftshift(F); % Shift so 0 frequencies are centered
df = freq / length(F); % Create step for x1 array
x1 = -freq/2:df:freq/2-df; % Create frequency domain

figure(2) % Apply following lines to figure(2) only
hold on
plot(xsin, abs(sinFourierShift),"r") % Plot sin wave
title("Frequency domain plot of noisy audio file, separated")
plot(x1, abs(Fshift), "b") % Plot in freq domain
xlabel("Frequency (Hz)");
ylabel("Samples");
