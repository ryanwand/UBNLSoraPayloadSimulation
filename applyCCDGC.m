function [signal] = applyCCDGC(photonCountAtSensorDiscrete)

Lam = photonCountAtSensorDiscrete(:,2)';
photons = photonCountAtSensorDiscrete(:,1);

for x = 1:length(Lam)
    counts(x) = photons(x,1)/GC_2(Lam(x)); %change CCDResponse to function for guider camera 
end

signal = [Lam' counts'];
end