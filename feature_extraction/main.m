clc;clear;

%% Init
db.path = '../database/';
db.name = 'database';
load([db.path db.name]);
db.num = numel(Database);

%% Local Phase Quantization
%{%
options.descriptor = 'LPQ';
options.winSize = 7;
options.level = 7;

for i=1:db.num
    j = 0;
    fea = [];
    while (true)
        j = j + 1;
        if (~(exist(['../faces/' Database(i).filename(1:end-4) '/' num2str(j) '.png'], 'file') == 2))
            break;
        end
        file = ['../faces/' Database(i).filename(1:end-4) '/' num2str(j) '.png'];
        img = rgb2gray(imread(file));
        fea(j,:) = PML(img,options);
    end
    
    if (size(fea,1) > 1)
        features(i,:) = [mean(fea)];
    else
        features(i,:) = [fea];
    end
    fprintf('Video (%d images) %d/%d (%s) \n',j,i,db.num, Database(i).filename);
end

save(['../features/' 'PML_' options.descriptor '_' num2str(options.level) '.mat'],'features','-v7.3');

%}

%% Binarized Statistical Image Features
%{%
options.descriptor = 'BSIF';
load ../toolboxes/bsif/texturefilters/ICAtextureFilters_9x9_8bit.mat
options.filter = ICAtextureFilters;
options.level = 7;

for i=1:db.num
    j = 0;
    fea = [];
    while (true)
        j = j + 1;
        if (~(exist(['../faces/' Database(i).filename(1:end-4) '/' num2str(j) '.png'], 'file') == 2))
            break;
        end
        file = ['../faces/' Database(i).filename(1:end-4) '/' num2str(j) '.png'];
        img = rgb2gray(imread(file));
        fea(j,:) = PML(img,options);
    end
    
    if (size(fea,1) > 1)
        features(i,:) = [mean(fea)];
    else
        features(i,:) = [fea];
    end
    fprintf('Video (%d images) %d/%d (%s) \n',j,i,db.num, Database(i).filename);
end

save(['features/' 'PML_' options.descriptor '_' num2str(options.level) '.mat'],'features','-v7.3');

%}