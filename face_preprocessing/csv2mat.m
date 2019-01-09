clc;clear;

load ../database.mat;

db_path = [cd '/'];
db.num = numel(Database);

for i=1:numel(Database)
    fprintf('Video %d/%d (%s) \n',i,db.num, Database(i).filename);
    file = fopen([db_path Database(i).folder '/' Database(i).filename(1:end-3) 'csv']);  
    tline = '';
    m = 1; 
    while ischar(tline)
        tline = fgets(file);
        points = [];
        if (tline ~= -1)
            C = strsplit(tline,';');
            for j=1:numel(C)-1
                K = strsplit(cell2mat(C(j)),',');
                points(j,:) = [str2num(cell2mat(K(1))) str2num(cell2mat(K(2)))];
            end
        end
        landmarks{m} = points;
        m = m +1;
    end
    save([db_path Database(i).folder '/' Database(i).filename(1:end-3) 'mat'],'landmarks');
end
