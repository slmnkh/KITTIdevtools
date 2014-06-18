function plotMultipleGPSTrackFiles(varargin)

%% input expected: varargin{1} = main track file path
%% varargin{2} = structure containing paths to all secondary track file paths



delete('trackData.txt');
delete('multiGpsTracks.kml');
fid = fopen('trackData.txt','a+');

addMainKML(fid, varargin{1});

secPaths = varargin{2};

for i = 1:length(secPaths)
    
    addKML(fid, secPaths{i});
    
end

fclose(fid);

system(['sudo bash -c ''cat kmlGlobalHeader.txt trackData.txt kmlGlobalFooter.txt > multiGpsTracks.kml''']);
