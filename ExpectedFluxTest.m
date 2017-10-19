WaveTop = 700;
WaveBottom = 350;
apparentMagnitude = 8.3;
exposure = 50; %second
aperturesize = 6.07; %cm diameter

radius = (aperturesize/100)/2;
area = pi*(radius).^2;

TrueIrradiance = xlsread('solar data\Refined Solar Data (ftg).xlsx');

Irradiation = limitIrradiance(TrueIrradiance,WaveTop,WaveBottom,10);

Lam = transpose(Irradiation(:,1));
Flux = Irradiation(:,2)';
logfactor = nthroot(100,5);

for x = 1:length(Lam)
    MagnitudeRad(x) = Flux(x)*logfactor.^(-26.74-(apparentMagnitude));
end

RelativeFlux = [Irradiation(:,1) transpose(MagnitudeRad)];

h = 6.62606957*10.^-34; %J s
c = 299792458; %m/s

    wavelength = RelativeFlux(:,1)';
    spectralIrradiance = RelativeFlux(:,2);
    
    for i = 1:length(wavelength)
    photonEnergies(i) = (h*c)/(wavelength(i)*10^-9);
    end
    
    for i = 1:length(photonEnergies)
        photonCountAtSensor(i,1) = (area*exposure*spectralIrradiance(i))/photonEnergies(i);
        photonCountAtSensorDiscrete(i,1) = floor(exposure*spectralIrradiance(i)/photonEnergies(i));
    end
    
    photonCountAtSensor(:,2) = wavelength';
    photonCountAtSensorDiscrete(:,2) = wavelength';

figure
plot(RelativeFlux(:,1), photonCountAtSensor(:,1))

totalphotons = sum(photonCountAtSensor(:,1))
