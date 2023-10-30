% Answer for problem 3

for i3 = 1:9
  for i2 = 0:9
      for i1 = 0:9
        i = i3^3 + i2^3 + i1^3;
        if i3*100 + i2*10 + i1 == i
          disp(i)
        endif
        % if we land on a combination of i3, i2 and i1 that satisfies the
        % condition, we display the number.
      endfor
    endfor
endfor
