clear
clc
clf

B = rand(1,10000) <= 0.4;
Frnd = rand(1,10000);

F(B==1) = Frnd(B==1) <= 2.0/8.0;
F(B==0) = Frnd(B==0) <= 3.0/4.0;

sum(F==1 & B==1) / 10000
sum(F==1 & B==0) / 10000
sum(F==0 & B==1) / 10000
sum(F==0 & B==0) / 10000



