for i = 100:999
i1 = mod(i, 10);
i2 = mod(floor(i/10), 10);
i3 = floor(i/100);
disp([i3 i2 i1])
endfor
