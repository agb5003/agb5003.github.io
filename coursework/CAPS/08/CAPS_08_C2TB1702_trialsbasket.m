clear
clc
figure(1), clf, hold on
figure(2), clf, hold on

runs = 10;

for i = 1:4 % Iterate through 10^i number of trials
  trials = 10^i;

  for j = 1:runs % The code inside this loop runs 10 times

    whichBox = rand(trials, 1); % Randomize which box is picked

    whichInRed = randi(8, trials, 1); % 8 fruits in red box
    whichInBlue = randi(4, trials, 1); % 4 fruits in blue box

    orangeInRedBox = whichInRed(whichBox <= 0.4) <= 6; % 6 oranges in red box
    orangeInBlueBox = whichInBlue(whichBox > 0.4) == 1; % 1 orange in blue box

    oranges = sum(orangeInRedBox) + sum(orangeInBlueBox);
    probOranges(j) = oranges / trials; % Put estimated probabilities in an array
  endfor

  % Mean of the estimated probability over 10 runs
  meanProb = sum(probOranges) / runs;
  printf("Arithmetic mean of %d trials over %d runs is %f\n", trials, runs, meanProb);

	varianceNumerator = 0;
  for k = 1:runs % Get sum of squared differences
    varianceNumerator += (probOranges(k) - meanProb)^2;
  endfor

  % Variance of the estimated probability over 10 runs
  variance = varianceNumerator / runs;
	printf("Variance of %d trials over %d runs is %f\n", trials, runs, variance);

  % Plot mean probability
  figure(1)
  semilogx(trials, meanProb, "x", "markersize", 8);

  % Plot variance
  figure(2)
  loglog(trials, variance, "x", "markersize", 8);

endfor


% Figure titling, annotations and adjustments below
figure(1)
meanTitle = ["Arithmetic mean of estimated probabilities over " num2str(runs) " runs"];
title(meanTitle, "fontsize", 14);
xlabel("Number of trials");
yl = ylim();
axis([5 10^4.05 yl(1)-0.02 yl(2)+0.02]); % Automatic axis adjustment
midpointY = (yl(1) + yl(2)) / 2;
ylabelPos = ([3 midpointY 0]);
ylabel("Mean estimated probability", "position", ylabelPos); % Automatic ylabel position adjustment

x = 0:10^5;
y = ones(length(x), 1);
y = y.*0.45;
plot(x,y, ";Actual probability;");


figure(2)
varianceTitle = ["Variance of estimated probabilities over " num2str(runs) " runs"];
title(varianceTitle, "fontsize", 14);
xlabel("Number of trials");
ylabel("Variance", "position", [6 10^-3 0]);
