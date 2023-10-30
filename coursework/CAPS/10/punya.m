clc
clear
load('rating2.txt');
[U,W,V]=svd(R);

i=1;
j=3;
k=7;

Rs=[R(:,i),R(:,j),R(:,k)];
Un=[U(:,i),U(:,j),U(:,k)];
Wn=[W(i:i+2,i),W(j-1:j+1,j),W(k-2:k,k)];
Vn=[V(:,1),V(:,3),V(:,7)];
P=Un*Wn;
s=Vn';

R(16,1)=4;
R(16,3)=2;
R(16,7)=3;

Pn=[R(16,1);R(16,3);R(16,7)];

S=[s(:,1),s(:,3),s(:,7)];
%p=(Rn')*pinv(S)
p=pinv(S')*Pn;
newP=[P;p'];
newR=newP*s;

Er=(abs(newR-R)./R)(1:length(P),:);

disp(newR)
disp(sum(sum(Er))/(length(P)*20)*100)
