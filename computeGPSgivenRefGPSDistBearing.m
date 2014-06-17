% % refs: 
% 
% MAIN REF: http://www.movable-type.co.uk/scripts/latlong.html
% 
% http://stackoverflow.com/questions/4913349/haversine-formula-in-python-bearing-and-distance-between-two-gps-points
% 
% http://www.gpsvisualizer.com/calculators

function gpsTr = computeGPSgivenRefGPSDistBearing(gpsIn, bearing, dist)

% gpsIn: Long , Lat , Alt

% long = lambda
% lat = phi

earthsRadius = 6371000;

longIn = gpsIn(2);
latIn = gpsIn(1);
theta = bearing;
sigma = dist/(earthsRadius);

% sigma = dist/(gpsIn(3)+earthsRadius);

latOut = asin(sind(latIn)*cos(sigma) + cosd(latIn)*sin(sigma)*cos(theta)) * 180 / pi;
longOut = longIn + (atan2(sin(theta)*sin(sigma)*cosd(latIn), cos(sigma) - sind(latIn)*sind(latOut)))*180/pi;

gpsTr = [longOut; latOut];

