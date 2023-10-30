clear
clc
clf
% Relation of Nobel Laureates per capita and chocolate consumption

% Data loading
table = load("Nobel_vs_choco_CAPS05_assignment.txt"); % Load data from .txt file
nobel = table(:,1); % column 1 is populated with data of nobel laureates
choco = table(:,2); % column 2 is populated with data of chocolate consumption

% Scatterplot
plot(choco, nobel,'+','markersize',5,"color","r") % plot a scatterplot of the relation
xlabel("Chocolate consumption per capita (kg/y/head)") % Label the axes
ylabel("Nobel laureates per capita")

% Line fitting
function fittedLine = lineFitter(table,choco,nobel)
  X = ones(length(table),2); % Initialize the X array
  X(:,1) = choco; % fill the first column of X with our x-axis values
  y = nobel; % fill the y array with our y-axis values
  fittedLine = pinv(X)*y; % Define fittedLine as the pseudoinverse of X, times y.
end

% Plot the fitted line
p = lineFitter(table,choco,nobel)
hold on
xx = 0:1:12;
plot(xx,p(1)*xx+p(2),'b',"color","r")

% Add new data point to the existing set
table = [table; 80, 1]; % Add new data point for CAPS Kingdom to the dataset
nobel = table(:,1);
choco = table(:,2);
% Update the scatterplot with new data
% Mark the new dataset with a blue cross so it's more visible
plot(choco(end),nobel(end),'x','markersize',4,"color","b")

% Fit the new line
p = lineFitter(table,choco,nobel)
xx = 0:1:12;
plot(xx,p(1)*xx+p(2),'b',"color","b")

