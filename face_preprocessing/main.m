clc;clear;
db.path = '../database/';
db.name = 'database';
load([db.path db.name]);
db.num = numel(Database);

for i=1:db.num
    fprintf('Video %d/%d (%s) ',i,db.num, Database(i).filename);
    videopath = [db.path db.name '/' Database(i).folder '/' Database(i).filename];
    face_data = load([db.path db.name '/' Database(i).folder '/' Database(i).filename(1:end-3) 'mat']);
    videodata = VideoReader(videopath);
    mkdir(['../faces/' Database(i).filename(1:end-4)])
    j = 1;
    k = 0;
      
    while (hasFrame(videodata))
        frame = readFrame(videodata);
        landmarks = cell2mat(face_data.landmarks(1,j));
        %{%
        if ( mod(j,100) == 0)
            fprintf('.');
        end
        %}
        if (~isempty(landmarks))
            k = k + 1;
            eyes = [(landmarks(37,1)+landmarks(40,1))/2 (landmarks(43,1)+landmarks(46,1))/2;10+(landmarks(37,2)+landmarks(40,2))/2 (landmarks(43,2)+landmarks(46,2))/2];
            face = alignement_crop(frame,[0.5 1 1.75],[224 224],eyes);
            imwrite(face, [['../faces/' Database(i).filename(1:end-4)] '/' num2str(k) '.png']);
        end
        j = j + 1;
    end
    
    fprintf(' done\n');
    
end
