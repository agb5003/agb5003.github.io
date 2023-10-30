% ratePredict
clear
clc

load('rating1.txt')

%song1 = 4 song3 = 2 song7 = 3

[U,W,V] = svd(R);

% Get the rank 3 approximation of R
P = U*W;
P = P(:,1:3);
S = V;
S = S(:,1:3)';

R(6,1) = 4; R(6,3) = 2; R(6,7) = 3;
R6withValue = R(R(6,:) > 0);
SwithValue = [S(:,1), S(:,3), S(:,7)];


P(6,:) = (SwithValue'\R6withValue')'

R(6,:) = P(6,:) * S
