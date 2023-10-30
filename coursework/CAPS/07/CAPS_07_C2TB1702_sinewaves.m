clear
clc
figure(1)
figure(2)
clf(1)
clf(2)

color = {'b', 'r', 'g', 'm'} % Array of colors to use for plotting

for i = 0:3
  % Frequency of the sine wave we want to create, decides the pitch of the sound.
  fsin = 440*2^i;
  lineTitle{i+1} = [num2str(fsin) " Hz"]; % Create cell array for legending
  T = 1/fsin; % Period of the wave
  amplitude = 0.5;% Amplitude of the wave

  % Define the sample frequency of the sound
  sampleRate = 44100; % Using standard CD quality sample frequency
  sampleLength = 1/sampleRate; % Length of time the sample is held for

  % Set duration of sound in seconds
  duration = 1;

  % Total number of samples in the whole duration
  samples = round(duration/sampleLength);

  sampleSpace = [0:samples-1]; % Creates a space for t to draw from
  t = sampleLength*sampleSpace;

  sinWave = amplitude*sin(2*pi*fsin*t); % Define the sine wave

  sound(sinWave, sampleRate) % Play the sound
  fileName = [lineTitle{i+1} ".wav"] % Name sound file accordingly
  audiowrite(fileName, sinWave, sampleRate) % Create sound file

  figure(1)
  hold on
  plot(t,sinWave, 'color', color{i+1}) % Plot in time domain
  legend(lineTitle)
  xlabel("Time (s)");
  ylabel("Amplitude");

  axis([0 1/440 -0.55 0.55]) % Axis adjustments for time domain

  shg % Just to show the plot window on top of all other windows

  sinFourier = fft(sinWave); % Apply Fourier transform to our sine wave
  sinFourierShift = fftshift(sinFourier); % Shift so 0 frequencies are centered
  df = sampleRate / samples; % Create step for xsin array
  xsin = -sampleRate/2:df:sampleRate/2-df; % Create domain

  figure(2) % Apply following lines to figure(2) only
  hold on
  plot(xsin, abs(sinFourierShift), 'color', color{i+1}) % Plot in freq domain
  axis([-4000 4000 -500 13000]) % Uncomment this line to zoom at the spikes
  legend(lineTitle)
  xlabel("Frequency (Hz)");
  ylabel("Samples");
endfor
