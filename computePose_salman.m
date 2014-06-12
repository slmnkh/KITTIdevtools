function pose = computePose_salman(base_dir, outputFormat)
% KITTI RAW DATA DEVELOPMENT KIT
%
% Written by Salman

% clear and close everything
% clear all; close all; dbstop error; clc;
% disp('======= KITTI DevKit Demo =======');

if nargin < 2
    
    outputFormat = 1;
    
end

% sequence base directory
if nargin<1
  base_dir = '/home/skhokhar/Desktop/KITTITesting/2011_09_26/2011_09_26_drive_0001_sync/';
end

% load oxts data
oxts = loadOxtsliteData(base_dir);

pose = {};

for i = 1:length(oxts)
    
    pose{i}.long = oxts{i}(1);
    pose{i}.lat = oxts{i}(2);
    pose{i}.alt = oxts{i}(3);
    pose{i}.bearing = oxts{i}(6); % KITTI data bearings are measured in radians counter clockwise from east = 0
    pose{i}.GISbearing = convertBearingToGIS(oxts{i}(6));% bearing definition as defined here: http://www.movable-type.co.uk/scripts/latlong.html
    % GIS bearing: measured in radians, clockwise from north
    
end


if outputFormat == 1
    
    temp = pose;
    pose = [];
    for i = 1:length(temp)
        pose = [pose; [temp{i}.long temp{i}.lat temp{i}.alt temp{i}.bearing temp{i}.GISbearing]];
    end
end

end

function GISpose = convertBearingToGIS(inPose) % refer to inPose and GISpose formats above

    if inPose >= 0 && inPose <= pi/2 % quadrant 1
        
        GISpose = pi/2 - inPose;
        
    elseif inPose >= 0 % quadrant 2
        
        GISpose = 2*pi - (inPose - pi/2);
        
    else % quadrants 3 and 4
        
        GISpose = -1*inPose + pi/2;
        
    end
    
end