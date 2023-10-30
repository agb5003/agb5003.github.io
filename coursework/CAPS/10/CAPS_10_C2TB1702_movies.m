% Movies
clear
clc

M = [1,3,5; 2,4,4; 2,3,5; 1,3,4]

population = rows(M); % Number of people in the friend group

[U,W,V] = svd(M); % SVD Decomposition to get L and R

% Getting the low-rank approximation of M
L = U*W;
R = V;
% Use the first few columns of the decomposition matrices
decomposeRank = 2;
R = R(:,1:decomposeRank)';
L = L(:,1:decomposeRank);

% Load data of new person
M(population+1,1) = 2; M(population+1,2) = 4;
newSongRatings = [M(population+1,1), M(population+1,2)];
selectedR = [R(:,1), R(:,2)];

% Find L for the new row
L(population+1,:) = newSongRatings*inv(selectedR);

% Extrapolate data from the pattern
M(population+1,:) = L(population+1,:) * R;

M(population+1,:)
