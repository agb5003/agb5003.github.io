clear
clc

% Earthquake probability

% Earthquakes occur 0.7*2 = 1.4 times in t0 = 7+1 = 8 days on all-time average
% Recently there has been 10 + 0 + 2 = 12 earthquakes in the last four weeks

% Calculate the probability of 12 and more earthquakes occurring in four consecutive weeks

lambda = 1.4; % Average number of earthquakes in 8 days
t0 = 8; % Reference time period
tq = 28;
t = tq/t0; % Expressed as multiple of t0
k = 12; % Limiter for events

for i = 0:k - 1 % Iterate from 0 to 11
  prob(i+1) = (lambda * t)^i * e^(-lambda * t) / factorial(i);
endfor

probKAndMore = 1 - sum(prob)
