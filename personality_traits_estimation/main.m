clc;clear;
db.path = '../database/';
db.name = 'database';
load([db.path db.name]);
db.num = numel(Database);

%% Labels
for i=1:db.num
    extraversion.ground_truth(i) = Database(i).extraversion; extraversion.estimated(i) = 0;
    neuroticism.ground_truth(i) = Database(i).neuroticism; neuroticism.estimated(i) = 0;
    agreeableness.ground_truth(i) = Database(i).agreeableness;  agreeableness.estimated(i) = 0;
    conscientiousness.ground_truth(i) = Database(i).conscientiousness;  conscientiousness.estimated(i) = 0;
    interview.ground_truth(i) = Database(i).interview;  interview.estimated(i) = 0;
    openness.ground_truth(i) = Database(i).openness;  openness.estimated(i) = 0;
end

%% Folds
for i=1:db.num
    folds(i) = Database(i).fold;
end
train = (folds == 1);
valid = (folds == 2);

%% Features
level = 7;
fea.name = ['PML_BSIF_' num2str(level)];
load(['../feature_extraction/features/PML_LPQ_' num2str(level) '.mat']);
v = features; clear features;
load(['../feature_extraction/features/PML_LPQ_' num2str(level) '.mat']);
features = [features v]; clear v;


%% Training & validation
extraversion.model = fitrsvm(features(train,:),extraversion.ground_truth(train),'KernelFunction','gaussian','KernelScale','auto','Standardize',true);
extraversion.estimated(valid) = predict(SVR.extraversion.model,features(valid,:));

neuroticism.model = fitrsvm(features(train,:),neuroticism.ground_truth(train),'KernelFunction','gaussian','KernelScale','auto','Standardize',true);
neuroticism.estimated(valid) = predict(neuroticism.model,features(valid,:));

agreeableness.model = fitrsvm(features(train,:),agreeableness.ground_truth(train),'KernelFunction','gaussian','KernelScale','auto','Standardize',true);
agreeableness.estimated(valid) = predict(agreeableness.model,features(valid,:));

conscientiousness.model = fitrsvm(features(train,:),conscientiousness.ground_truth(train),'KernelFunction','gaussian','KernelScale','auto','Standardize',true);
conscientiousness.estimated(valid) = predict(conscientiousness.model,features(valid,:));

openness.model = fitrsvm(features(train,:),openness.ground_truth(train),'KernelFunction','gaussian','KernelScale','auto','Standardize',true);
openness.estimated(valid) = predict(openness.model,features(valid,:));

interFea = [extraversion.ground_truth(train)' , ...
    neuroticism.ground_truth(train)' , ...
    agreeableness.ground_truth(train)' , ...
    conscientiousness.ground_truth(train)' , ...
    openness.ground_truth(train)'; ...
    extraversion.estimated(valid)' , ...
    neuroticism.estimated(valid)' , ...
    agreeableness.estimated(valid)' , ...
    conscientiousness.estimated(valid)' , ...
    openness.estimated(valid)'];


interview.sigma0 = std(interview.ground_truth(train));
interview.sigmaF0 = interview.sigma0;
interview.d = size(interFea(train,:),2);
interview.sigmaM0 = 10*ones(interview.d,1);

interview.model = fitrgp(interFea(train,:),interview.ground_truth(train),'Basis','none','FitMethod','exact',...
    'PredictMethod','exact','KernelFunction','ardsquaredexponential',...
    'KernelParameters',[interview.sigmaM0;interview.sigmaF0],'Sigma',interview.sigma0,'Standardize',1);
interview.estimated(valid) = predict(interview.model,interFea(valid,:));

j = 1;
for i=sum(train)+1:db.num
    pred_i(j)= interview.estimated(i);
    pred_a(j) = agreeableness.estimated(i);
    pred_c(j) = conscientiousness.estimated(i);
    pred_e(j) = extraversion.estimated(i);
    pred_n(j) = neuroticism.estimated(i);
    pred_o(j) = openness.estimated(i);
    j = j + 1;
end
save('results.mat','pred_i','pred_a','pred_c','pred_e','pred_n','pred_o');
