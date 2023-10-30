clear
clc
clf
% Relation of Nobel Laureates per capita and chocolate consumption

% Data loading
table = load("Nobel_vs_choco_CAPS05_assignment.txt") % Load data from .txt file
table = [table; 80,1]; % Add new data point for CAPS Kingdom to the dataset
nobel = table(:,1) % column 1 is populated with data of nobel laureates
choco = table(:,2) % column 2 is populated with data of chocolate consumption

% Scatterplot
plot(choco, nobel,'+','markersize',5,"color","r") % plot a scatterplot of the relation
xlabel("Chocolate consumption per capita (kg/y/head)") % Label the axes
ylabel("Nobel laureates per capita")

% Line fitting
X = ones(length(table),2); % Initialize the X array
X(:,1) = choco; % fill the first column of X with our x-axis values
y = nobel; % fill the y array with our y-axis values
p = pinv(X)*y; % Define p as the pseudoinverse of X, times y.

% Plot the fitted line
hold on
xx = 0:1:12; % we need to define x values for the straight line to iterate through
plot(xx,p(1)*xx+p(2),'b',"color","k") % plot y = ax+b against the xx we just defined
