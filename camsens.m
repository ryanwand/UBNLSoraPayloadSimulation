function [output] = camsens(lambda)
a1 = 0.3188;
b1 = 471.1;  
c1 = 84.66;  
a2 = 0.804; 
b2 = 582.9;  
c2 = 179.2; 
a3 = 0.07928;  
b3 = 425.4; 
c3 = 23.63; 
a4 = 0.216;  
b4 = 771.2;  
c4 = 225.3;  
y = a1*exp(-((lambda-b1)/c1).^2) + a2*exp(-((lambda-b2)/c2).^2) + a3*exp(-((lambda-b3)/c3).^2) + a4*exp(-((lambda-b4)/c4).^2);
output = y;
end