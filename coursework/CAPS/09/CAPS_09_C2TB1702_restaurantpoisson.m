% Restaurant
clear
clc

lambda = 13.5 % Average events in reference time interval
t0 = 1 % Reference time interval in days
tq = 7 % Asked-for time interval
t = tq/t0 % Time interval as expressed in multiple of t0

for i = 0:89 % Iterate from k = 0 to k = 89
  % Use Poisson distribution formula
  p(i+1) = (e^(-lambda * t) * (lambda * t)^i) / factorial(i);
endfor

% Subtract sum of probabilities from unity to get answer
1 - sum(p)
