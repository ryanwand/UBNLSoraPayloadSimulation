%% payloadModelTest
%Run this script to actually call the payloadModel with specific inputs.
%The end goal will be to use this script to run the payloadModel with a
%wide range of apertures, to provide us with the ability to compare
%aperture size/optical performance with the ability to perform the mission.
clc
close all
clear

%% The Model's current run setup:
wavelengthTop = 900; %highest wavelength we're observing nm

wavelengthBottom = 350; %lowest wavelength we're observing nm

binSize = 50; %bin size of optical system in nm *initially in m
bin = 50; %bin size for aperture

eff1 = 0.9; %set to 0.9 for lens, 0.85 for mirror

eff2 = 1; %set to 0.92 for lens, 0.85 for mirror

apparentMagnitude = 7.3; %apparent magnitude of target
appmag = 8.3;

setup = 1; %1 = off axis, 2 = on axis, when simulating lens use setup 1

exposure = 1; %The exposure time in seconds
exposureoptics = 30; %Exposure time for aperture calculation

%Make a new script similar to OpticalFeed
aperture = OpticalFeed(1.5,2,wavelengthBottom,wavelengthTop,bin,eff1,eff2,550,exposureoptics,appmag,setup);
%Diameter opening in cm.  This will later be a range of values (MAYBE).
%do not alter anything above except 
specReflProfile = csvread('csv files/Aluminum Spectral Data.csv'); %This is the directory to the target's reflectivityprofile

sysEff = eff1*eff2;%csvread('csv files/SampleSysEff.csv');

T = 5778; %K  (Temperature of the sun)
%% Run the payloadModel with the desired input data:
payloadModel(wavelengthTop, wavelengthBottom, binSize, apparentMagnitude, aperture, specReflProfile, sysEff, T, exposure)