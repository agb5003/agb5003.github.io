clear
clc

% p = [x, v]

% Defining derivatives
function dp = derive(t, p)
  dp = [p(2), -p(2)-3*p(1)];
end

% Solve using ode45, plugging in time interval and initial conditions
[T, result] = ode45(@derive, [0,15], [1,0]);

hold on
plot(T, result(:,1), "r", "linestyle", "--"); % Use red dashed line to plot
xlabel("Time since t=0");
ylabel("Displacement of the mass");
