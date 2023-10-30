% This is weird but matlab and octave uses percent to write comments

clc, clearvars

x = 1:10
x' % this reads "x transpose" which converts the horizontal array x to a
% vertical one. note that x is still the horizontal array, the operator did not
% change the nature of the array.
