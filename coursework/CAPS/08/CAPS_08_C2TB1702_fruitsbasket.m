% Fruits basket
clear
clc

trials = 1000;

whichBox = rand(trials, 1);

whichInRed = randi(8, trials, 1); % 8 fruits in red box
whichInBlue = randi(4, trials, 1); % 4 fruits in blue box

orangeInRedBox = whichInRed(whichBox <= 0.4) <= 6;
orangeInBlueBox = whichInBlue(whichBox > 0.4) == 1;

oranges = sum(orangeInRedBox) + sum(orangeInBlueBox)
probOranges = oranges / trials
