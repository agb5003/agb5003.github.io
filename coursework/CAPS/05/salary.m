years = 5:5:35
income = [371,460,534,598,670,720,754];
plot(years,income,'x', "markersize", 5);
axis([0,40,0,900])
xlabel ('Years')
ylabel ('Income (Millions JPY)')
set(gca,'fontsize',14)
X=ones(7,2);
X(:,1)=years';
y=income';
p=pinv(X)*y;
hold on
xx=0:1:40;
plot(xx,p(1)*xx+p(2),
'b', 'Linewidth',2)
