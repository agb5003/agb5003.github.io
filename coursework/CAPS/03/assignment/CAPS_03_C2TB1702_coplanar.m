clear
clc

% First, initialize random numbers
r = -0.1+(0.2)*rand(3,3);
% r is a 3x3 matrix containing random numbers we can use for rx1,rx2 and so on

% Next, initialize the points
P = [0.2,0.1,1.0;3.0,0.1,-1.0;1.0,-2.0,-0.5] + r;

% Then we initialize the matrix containing student number
R = [1702;1702;1702];

% Do Gaussian elimination to find unknowns and collect in Q
Q = P\R;

printf('a = %f, b = %f, c = %f\n',Q(1), Q(2), Q(3))
