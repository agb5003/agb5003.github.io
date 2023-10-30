% Answer for problem 1

% First, we initiate the array "num" which contains all the numbers
% from 100 through 999.
num = 100:999;

% Next, we get the digits from each number in the list.
% Note that I'm following the convention used in problem 2, where
% i1 = digit1 is the last digit (ones), i2 = digit2 is the second
% to last digit (tens), and so on.
digit1 = mod(num, 10); digit2 = mod(floor(num/10), 10); digit3 = floor(num/100);

% We can now get the sum of the cubes of all the numbers in the array, and
% collect them in the array "sum".
sum = digit1.^3 + digit2.^3 + digit3.^3;

% And then we store the numbers where the sum of the cubed digits equal itself
% in the array "answers".
answers = num(num == sum);

disp(answers)
