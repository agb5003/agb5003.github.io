% Answer for problem 2

for i = 100:999
  i1 = mod(i, 10);
  i2 = mod(floor(i/10), 10);
  i3 = floor(i/100);
  if i1^3 + i2^3 + i3^3 == i
    answer = i3*100 + i2*10 + i1;
    disp(answer)
    % This way, the numbers are displayed as actual numbers.
  endif
endfor
