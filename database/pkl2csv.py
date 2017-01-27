import pickle
import numpy, scipy.io
import os
import h5py

delimiter = '@'
i = 1

csv_file = "database.csv"
f = open(csv_file, 'w')
f.write('id,image,fold,interview,agreeableness,conscientiousness,extraversion,neuroticism,openness' + '\n')

# Load
file = open('annotation_training.pkl', "rb")
training = pickle.load(file)
file = open('transcription_validation.pkl', "rb")
validation = pickle.load(file)

for subject in training['interview']:
    f.write(str(i) + delimiter + subject + delimiter + '1' + delimiter + str(training['interview'][subject]) + delimiter + str(training['agreeableness'][subject]) + delimiter + str(training['conscientiousness'][subject]) + delimiter + str(training['extraversion'][subject]) + delimiter + str(training['neuroticism'][subject]) + delimiter + str(training['openness'][subject]) + '\n')
    i = i + 1

for subject in validation:
    f.write(str(i) + delimiter + subject + delimiter + '2' + delimiter + '0' + delimiter + '0' + delimiter + '0' + delimiter + '0' + delimiter + '0' + delimiter + '0' + '\n')
    i = i + 1
f.close()
