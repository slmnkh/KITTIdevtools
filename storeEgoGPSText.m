
% sample path: /home/skhokhar/common/people/skhokhar/KITTI/unzipped/cityUnzipped/synced/2011_09_26_drive_0001_sync

trackletPath = '/home/skhokhar/common/people/skhokhar/KITTI/unzipped/cityUnzipped/tracklets/';
gpsDataPath = '/home/skhokhar/common/people/skhokhar/KITTI/unzipped/cityUnzipped/synced/';
drivesWithTracklets = dir(trackletPath);
for i = 1:2
    drivesWithTracklets(1) = []; % first two folders are some kind of system folders (names: "." and "..")
end

for iFile = 1:length(drivesWithTracklets)
    
    path = [gpsDataPath drivesWithTracklets(iFile).name(1:end-9) 'sync/'];
    getGpsTrack(path); % this will save coords.txt in local folder
    iFile
    
    temp_txt = [path 'trackletGPSFiles/egoVehicle.txt'];
    system(['sudo cp coords.txt ' temp_txt]);

end
