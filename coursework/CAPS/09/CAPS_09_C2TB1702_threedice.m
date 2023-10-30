% Calculating probability of the sum of three dices being 10
clear
clc

wantedSum = 10;

combinations = []; % Initialize empty array
for i = 1:6 % Iterate through all possible combinations
  for j = 1:6
    for k = 1:6
      if i + j + k == wantedSum % If the sum matches
        newComb = sort([i,j,k]')'; % sort the combination
        % put the combination inside the array
        combinations = [combinations; newComb];
      endif
    endfor
  endfor
endfor

% Probability of getting sum of 10
probTen = length(combinations) / 6^3;
probText = ["The probability of getting " num2str(wantedSum) " as a sum is " num2str(probTen*100) "%%.\n"]; % Show probability as percentage
printf(probText)

printf("The valid combinations are: \n")
disp(unique(combinations, "rows"));
