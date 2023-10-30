% Experiment 2.1 Trying out conditionally accessing array elements

% Initialize arrays A and B as random numbers
A = [2,3,4,6,7,8];
B = [2,1,4,9,7,10];
% C will only display numbers in A that are also in B
C = A(A == B)
