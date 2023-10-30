% ratePredict
clear
clc

% Load the rating data into R. Change datasets here.
load('rating1.txt')

population = rows(R); % Number of people rating songs
songs = columns(R);

[U,W,V] = svd(R); % SVD Decomposition to get P and S

% Getting the rank 3 approximation of R
P = U*W;
S = V;
% Use the first three columns of the decomposition matrices
decomposeRank = 3;
S = S(:,1:decomposeRank)';
P = P(:,1:decomposeRank);

rank3Approx = P*S % Rank 3 approximation of the matrix

% Load data of new person
R(population+1,1) = 4; R(population+1,3) = 2; R(population+1,7) = 3;
newSongRatings = [R(population+1,1), R(population+1,3), R(population+1,7)];
selectedS = [S(:,1), S(:,3), S(:,7)];

% Inverse matrix method:
% P(population+1,:) = newSongRatings*inv(selectedS);

% Gaussian elimination is faster than inverse matrices in large data sets.
P(population+1,:) = (selectedS'\newSongRatings')';

R(population+1,:) = P(population+1,:) * S;

predicted = R(population+1,:)

actualratings = [4,3,2,2,3,3,3,2,3,1,2,3,2,2,3,4,3,3,3,3];

% Average difference
differences = abs(R(population+1,:) - actualratings);
meanDifference = sum(differences)/songs
