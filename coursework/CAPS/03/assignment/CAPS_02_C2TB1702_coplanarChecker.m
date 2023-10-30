clc
% I don't use the function clear because that would erase the variables we need
% to check the validity of our answer

correctRows = 0; % Initialize number of correct rows as 0
for i = 1:3 % Iterate from row 1 through 3
  isR = round(dot(P(i,:),Q)) % dot row i of P with Q
  if isR == R(i) % Check if the result of the dot is same as student number
    printf('Row %d is correct\n', i)
    correctRows += 1; % If this row is correct, add 1 to # of correct rows
  else
    printf('!! Row %d is INCORRECT !!\n', i)
  endif
endfor

if correctRows == length(P) % Check if # of correct rows equal # of rows in P
  printf('All rows are correct. The program is working as intended.\n')
else
  printf('There are incorrect rows. Check the program again for bugs.\n')
endif
