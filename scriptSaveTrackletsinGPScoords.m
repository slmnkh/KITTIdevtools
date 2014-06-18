
trackletpath = '/home/skhokhar/common/people/skhokhar/KITTI/unzipped/cityUnzipped/tracklets/';
base_dir = '/home/skhokhar/common/people/skhokhar/KITTI/unzipped/cityUnzipped/synced/';
list = dir(trackletpath);

list(1) = []; % remove two system folders
list(1) = [];

for i = 1:length(list)
    
    saveTrackletsinGPScoords(list(i).name(1:end-9));
    
end