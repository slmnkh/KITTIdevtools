function plotMultipleGPSTrackFiles(varargin)

%% inputs expected: varargin{1} = main track file path
%% varargin{2} onwards, secondary track file paths

delete('trackData.txt');
delete('multiGpsTracks.kml');
fid = fopen('trackData.txt','a+');

for i = 1:nargin
    
    if i == 1
        
        addMainKML(fid, varargin{1});
        
    else
        
        addKML(fid, varargin{i});
        
    end
   
    i = i + 1;
    
end

fclose(fid);

system(['sudo bash -c ''cat kmlGlobalHeader.txt trackData.txt kmlGlobalFooter.txt > multiGpsTracks.kml''']);
