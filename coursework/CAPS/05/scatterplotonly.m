% Data loading
table = load("Nobel_vs_choco_CAPS05_assignment.txt") % Load data from .txt file
nobel = table(:,1) % column 1 is populated with data of nobel laureates
choco = table(:,2) % column 2 is populated with data of chocolate consumption

% Scatterplot
plot(choco, nobel,'+','markersize',5,"color","r") % plot a scatterplot of the relation
xlabel("Chocolate consumption per capita (kg/y/head)") % Label the axes
ylabel("Nobel laureates per capita")
