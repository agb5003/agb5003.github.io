% Calculating the position of a vehicle with a constant acceleration
a = 4
for t = 0:20
  curX = 0.5*a*t^2;
  X[t] = curX
  printf('%f: %f\n',t,x)
endfor

plot(T,X)
