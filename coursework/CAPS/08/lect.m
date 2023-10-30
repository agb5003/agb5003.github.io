%box_fruit.m

clear
clc
clf

num_bf = zeros(2,2);
for i=1:10000
  if rand(1,1) <= 0.4, % red box (40%)
    if rand(1,1) <= 2.0/8.0, % apple
      num_bf(1,1) += 1;
    else % orange
      num_bf(2,1) += 1;
    end
  else % blue box
    if rand(1,1) <= 1.0/4.0, % orange
      num_bf(2,2) += 1;
    else % orange
      num_bf(1,2) += 1;
    end
  end
end

