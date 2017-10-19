I = xlsread('csv files\GREENLEDSPECTRAINTENSITY.xlsx');
Iwav = I(:,1);
Isig = I(:,2);

figure
plot(Iwav,Isig,'LineWidth',3)
title('Intensity vs. Wavelength Green LED','FontSize',18)
xlabel('Wavelength (nm)','FontSize',18)
ylabel('Intensity (counts)','FontSize',18)
