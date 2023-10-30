data = load('Nobel_vs_choco_CAPS05_assignment.txt');
choco = data(:,2);
nobel = data(:,1);
X = [ones(length(choco),1) choco]
