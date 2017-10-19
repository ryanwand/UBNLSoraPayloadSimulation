%This program automates image analysis
clc
disp('Program Started')
%addpath('D:\Users\Ari\Desktop\UBNL\To add to fileserv\Already added\AutoAnalysis Functions');
FolderYouWantToPullFrom = 'Z:\Nanosat 8\I&T\Released Documents\7XX - SCI Tests\I&T-722 Thermal Noise Test Photos-RGB' ;%Place path to foulder you want to pull form here.
MetaData = 5;% 0==None 1==ExpOnly 2==GainOnly 3==TempOnly 4==Exp+Gain 5== Exp+Temp 6==Gain+Temp 7==All
TempSignifier = 'T';%what you placed before where you entered the temperature
GainSignifier = 'Gain';%what you placed before where you entered the Gain
ExposureSignifier= 'EXP';%what you placed before where you entered the Exposure
addpath(FolderYouWantToPullFrom);
[Data,RouteData] = PullDataBmp(FolderYouWantToPullFrom,MetaData,TempSignifier,GainSignifier,ExposureSignifier);
DataSizeHolder = size(Data);
Datasize = DataSizeHolder(1,2);
Size = length(RouteData);
x = 1;
NoiseSTD = zeros(1,Size);
while x < (Size+1)
    NoiseSTD(x) = std2(double(imread(char(RouteData(x)))));
    x=x+1;
end
Noise = transpose(NoiseSTD);
data = TempGrouper( Data,Noise,MetaData );
[a,NumberOfTemps] = size(data);
while a<(NumberOfTemps+1)
    hold on
    [sizer,holder]=size(data{a});
    disp(a)
    disp(sizer)
    disp(size(Noise((a):(sizer+1),1)))
    plot3(data{a}(:,1),data{a}(:,2),Noise((a):(sizer),1),'*')
    a=a+1;
end
disp('Program Ended')