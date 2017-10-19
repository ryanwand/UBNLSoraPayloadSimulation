function [output] = GC_2(x2)
y2 = camsens(x2(:,1));
y3 = (y2.*26.3)./.9056;
output = [x2(:,2) y3];
end