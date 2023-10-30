x = 0;0.1;10; % define the domain
x0= [0.3;2.6;3.8;5.2;9.8]; % put initial guess in x0 array
function y = f(x) % define function
  y = sin (x).^2.*exp(-x/2)+0.01.*x-0.1;
end
result = fsolve(@f, x0) % use fsolve
