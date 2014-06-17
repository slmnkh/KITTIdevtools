

trackletPath = '/home/skhokhar/common/people/skhokhar/KITTI/unzipped/cityUnzipped/tracklets/';
gpsDataPath = '/home/skhokhar/common/people/skhokhar/KITTI/unzipped/cityUnzipped/synced/';
drivesWithTracklets = dir(trackletPath);
for i = 1:2
    drivesWithTracklets(1) = []; % first two folders are some kind of system folders (names: "." and "..")
end

for iFile = 1:length(drivesWithTracklets)
    
    path = [gpsDataPath drivesWithTracklets(iFile).name(1:end-9) 'sync/'];
    makeKml(path);
    iFile

end
