clear
clc

figure(1), clf
figure(2), clf

% Iterating on trial numbers

% Plot the resulting probability estimates
function plotProb(trials, meanProb)
	figure(1)
	hold on
	semilogx(trials, meanProb, "x", "markersize", 8)
	axis([5 10^4.05])
endfunction

for i = 1:4 % Iterate through different trial numbers
  trials = 10^i;
  for j = 1:10 % Run estimation 10 times
    B = rand(1,trials) <= 0.4;
    Frnd = rand(1,trials);

    F(B==1) = Frnd(B==1) <= 2.0/8.0;
    F(B==0) = Frnd(B==0) <= 3.0/4.0;

    pF0(j) = (sum(F==0 & B==0) + sum(F==0 & B==1)) / trials;
  endfor
  meanpF0 = sum(pF0) / 10
	plotProb(trials, meanpF0)
	sumDifferenceSquare  = sum((pF0 - meanpF0).^2);
  variance(i) = sumDifferenceSquare / 10;
endfor

% Plot the resulting variance numbers
figure(2)
trialsAxis = [10, 100, 1000, 10000];
loglog(trialsAxis, variance, "x", "markersize", 8, "color", "r")
title("Variance of Monte Carlo Estimated Probabilities as Number of Trials Increases", "fontsize", 14)
xlabel("Number of trials")
ylabel("Variance in 10 runs of estimations", "position", [6 10^(-3) 0])
movegui(2, "northeast")
shg

% Adjustments for figure 1
figure(1), movegui(1, "northwest")
title("Average estimated probabillity vs number of trials", "fontsize", 14)
xlabel("Number of trials")
xl = xlim();
actualProb = 0.45;
plot([xl(1), 10000], [actualProb, actualProb], "b")
yl = ylim();
midpoint = (yl(2) + yl(1)) / 2;
ylabel("Average probability estimate over 10 runs", "position", [2.8 midpoint 0])
%axis([0 10^4.1 yl(1)-0.1 yl(2)+0.1])
shg
