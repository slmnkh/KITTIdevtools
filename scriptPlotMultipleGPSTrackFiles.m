path = '/home/skhokhar/common/people/skhokhar/KITTI/unzipped/cityUnzipped/synced/2011_09_26_drive_0009_sync/trackletGPSFiles';

mainFile = [path '/egoVehicle.txt'];

secTracksPath = [path '/txt/'];

list = dir([secTracksPath '*.txt']);

plotMultipleGPSTrackFiles(mainFile, [secTracksPath list(1).name], [secTracksPath list(2).name])