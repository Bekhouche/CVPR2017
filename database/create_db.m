clc;clear all;

db_path = '';
delimiter = '@';

for i=1:4
    for j=1:12
        folders(j+(i-1)*12).name = sprintf('train-%d/training80_%2.2d',i,j+(i-1)*12);
    end
end


for j=1:13
    folders(numel(folders)+1).name = sprintf('train-%d/training80_%2.2d',5,j+48);
end



for j=1:14
    folders(numel(folders)+1).name = sprintf('train-%d/training80_%2.2d',6,j+61);
end

numF = numel(folders);

for j=1:13
    folders(j+numF).name = sprintf('val-%d/validation80_%2.2d',1,j);
end

for j=1:12
    folders(j+13+numF).name = sprintf('val-%d/validation80_%2.2d',2,j+13);
end

fid = fopen('database.csv');

tline = fgets(fid);
while ischar(tline)
    tline = fgets(fid);
    if (ischar(tline))
        newStr = split(tline,delimiter);
        id = str2num(cell2mat(newStr(1)));
        file = cell2mat(newStr(2));
        fold = str2num(cell2mat(newStr(3)));
        
        Database(id).id = id;
        
        for j=1:numel(folders)
            if exist([db_path folders(j).name '/' file], 'file') == 2
                Database(id).folder = folders(j).name;
            end
        end
        
        Database(id).filename = file;
        
        %video = VideoReader([db_path Database(id).folder '/' Database(id).filename]);
        
        %Database(id).VideoFormat = video.VideoFormat;
        %Database(id).Duration = video.Duration;
        %Database(id).FrameRate = video.FrameRate;
        %Database(id).Width = video.Width;
        %Database(id).Height = video.Height;
        %Database(id).BitsPerPixel = video.BitsPerPixel;
        
        Database(id).interview = str2num(cell2mat(newStr(4)));
        Database(id).agreeableness = str2num(cell2mat(newStr(5)));
        Database(id).conscientiousness = str2num(cell2mat(newStr(6)));
        Database(id).extraversion = str2num(cell2mat(newStr(7)));
        Database(id).neuroticism = str2num(cell2mat(newStr(8)));
        Database(id).openness = str2num(cell2mat(newStr(9)));
        
        
        Database(id).transcription = '';
        Database(id).fold = fold;
        
    end
    
end

fclose(fid);


save('database.mat','Database', '-v7.3');