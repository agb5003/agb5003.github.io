clear
clc
clf

for k = 0:10
  nchoosek(10,k)*0.2^k*(1-0.2)^(10-k)
end
