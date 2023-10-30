clear
clc
clf

% Plotting the manually obtained equation of motion
t = 0:0.1:15;
x = exp(-t/2).*(cos(sqrt(11).*t/2) + (sqrt(11)/11).*sin(sqrt(11).*t/2));

plot(t,x,"cyan","linewidth", 3) % use solid semibold cyan line to plot
xlabel("Time since t=0");
ylabel("Displacement of the mass");
