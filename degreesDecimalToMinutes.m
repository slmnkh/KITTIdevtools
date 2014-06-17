function degrees_minutes=degreesDecimalToMinutes(degrees)
% Convert latitude and longitude between
% decimal degrees and degrees, minutes, and seconds 
% Output is an array: [degrees,minutes,seconds] 
% 
% Example: To convert 23.554 
%   degrees_minutes = degreesDecimalToMinutes(23.554)
%   degrees_minutes =
%       23.0000   33.0000   14.4000
%
% Matthew Perrett 2012

degrees_minutes = nan(1,3);
% Get degrees
degrees_minutes(1) = fix(degrees);
degrees = abs(degrees - degrees_minutes(1));
% Get minutes
degrees_minutes(2) = floor(degrees * 60) ;
degrees = degrees - degrees_minutes(2)/60;
% Get seconds
degrees_minutes(3) = degrees * 3600;
end