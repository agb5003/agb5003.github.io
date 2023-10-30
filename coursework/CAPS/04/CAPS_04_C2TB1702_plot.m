clear
clc

x = 0:0.1:20; % Define the domain
y = sin (x).^2.*exp(-x/2)+0.01.*x-0.1; % Define y as a function of x
intercept = zeros(1,length(x)); % Draw a line for y = 0 to find intercepts
plot(x, y, "m", x , intercept);
