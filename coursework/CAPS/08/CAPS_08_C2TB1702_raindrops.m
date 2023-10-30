% Raindrop pi

clear
clc
clf

arithmeticMean = 0;
for i = 1:100
	% Initiate random raindrops
	drops = rand(2, 10000);

	% Distance of raindrop from origin
	distance = sqrt(drops(1,:).^2 + drops(2,:).^2);

	% Logical array of all drops inside the quadrant
	inside = distance <= 1;

	% Estimate pi
	piEstimate = 4 * sum(inside)/10000;

	arithmeticMean += piEstimate / 100;
endfor

% Plot the last run just for an illustration
hold on
plot(drops(1,:), drops(2,:), ".")
r = 1;
t = linspace(0,2*pi,100)';
circsx = r.*cos(t);
circsy = r.*sin(t);
plot(circsx, circsy, "linewidth", 2);
axis([0 1 0 1], "square")
shg

arithmeticMean
