
function addMainKML(fid, path)

% add track data

temp = fileread('mainTrackHeader.txt');

fprintf(fid, '%s', temp);

temp = fileread(path);
tempCoords = temp;

fprintf(fid, '%s', temp);

temp = fileread('mainTrackFooter.txt');

fprintf(fid, '%s', temp);

fprintf(fid, '%c', 10); % new line

% add starting position placemark

startCoord = tempCoords(1:find(tempCoords==10,1,'first'));

temp = fileread('trackStartHeader.txt');

fprintf(fid, '%s', temp);

fprintf(fid, '%s', startCoord);

temp = fileread('trackStartFooter.txt');

fprintf(fid, '%s', temp);

fprintf(fid, '%c', 10);


% add ending position placemark

endInds = find(tempCoords==10,2,'last');

endCoord = tempCoords(endInds(1)+1:end);

temp = fileread('trackEndHeader.txt');

fprintf(fid, '%s', temp);

fprintf(fid, '%s', endCoord);

temp = fileread('trackEndFooter.txt');

fprintf(fid, '%s', temp);

fprintf(fid, '%c', 10);

