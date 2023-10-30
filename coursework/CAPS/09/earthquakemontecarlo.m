% Monte carlo for earthquakes

clear

l = 4.9;

random = randp(l, 100, 1);

more = random >= 12;

hist(random)

sum(more)
