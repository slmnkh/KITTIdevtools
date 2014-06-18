path = '/home/skhokhar/common/Project/VSLAM-2k/2014_6_17_Rakesh';

temp = fileread([path '/GPS_061714_152841.txt']);
fid = fopen('Coords.txt','w+');
i = 0

    lineBreak = find(temp == 10);
    lineBreak = lineBreak(5000);
temp(1:lineBreak) = [];

while(length(temp)>20)
   
    lineBreak = find(temp == 10);
    lineBreak = lineBreak(100);
    line = temp(1:lineBreak);
    temp(1:lineBreak) = [];
%     if mod(i,10) == 0
    dateMark = find(line == 44);
    line = line(dateMark(3)+1:dateMark(6)-1);
    comma = find(line == 44);
    lat = line(1:comma(1)-1);
    long = line(comma(1)+1:comma(2)-1);
    alt = line(comma(2)+1:end);
    fprintf(fid, '%s%c%s%c%d%c',long,44,lat,44,20,10);
%     end
    i = i + 1
end