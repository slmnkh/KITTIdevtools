function makeKml(path)
%makes a kml file for use in google earth
%input:  name of track, one matrix containing latitude and longitude
%usage:  pwr_kml('track5',latlon)
if nargin < 1 
    path = '/home/skhokhar/common/people/skhokhar/KITTI/unzipped/cityUnzipped/synced/2011_09_26_drive_0017_sync/';
end

system(['sudo touch ' path '/gpsTracks.kml']);
getGpsTrack(path);
system(['sudo bash -c ''cat kmlheader.txt coords.txt kmlfooter.txt > ' path 'gpsTracks.kml''']);


end

% function gpsTrack = getGpsTrack(path)
% 
%     format long g
%     gpsTrack = [];
%     
%     gpsDataList = dir([path '/oxts/data/*.txt']);
%     
%     for iFile = 1:length(gpsDataList)
%         
%         iFile;
%         fid = fopen([path '/oxts/data/' gpsDataList(iFile).name],'r');
%         temp = textscan(fid, '%f');
%         temp = temp{1};
%         gpsTrack = [gpsTrack; [temp(2) temp(1) temp(3)]];
%         fclose(fid);
%         
%     end
% %     
%     fid = fopen('coords.txt', 'w');
%     fprintf(fid, '%.20f,%.20f,%.20f\n', gpsTrack');
%     fclose(fid);
% 
% end
      