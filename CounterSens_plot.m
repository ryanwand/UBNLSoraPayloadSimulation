Data = csvread('Geigcount_Sens.csv');
x = linspace(400,1050,650);

for i = 1:650
    y(i) = camsens(x(i));
end
plot(x,y);
grid on