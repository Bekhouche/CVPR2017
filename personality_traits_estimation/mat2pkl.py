import pickle
import numpy, scipy.io
import os
import zipfile

pkl_file = 'valid_prediction.pkl'
file = open(pkl_file, "rb")
prediction = pickle.load(file)

mat_file = 'results.mat'
import scipy.io
mat_data = scipy.io.loadmat(mat_file)

i = 0
for subject in prediction['extraversion']:
    prediction['interview'][subject] = mat_data['pred_i'][0][i]
    prediction['agreeableness'][subject] = mat_data['pred_a'][0][i]
    prediction['conscientiousness'][subject] = mat_data['pred_c'][0][i]
    prediction['extraversion'][subject] = mat_data['pred_e'][0][i]
    prediction['neuroticism'][subject] = mat_data['pred_n'][0][i]
    prediction['openness'][subject] = mat_data['pred_o'][0][i]
    i = i + 1

new_pkl_file = 'predictions.pkl'
print new_pkl_file
new_file = open(new_pkl_file, "wb")
pickle.dump(prediction, new_file)
file.close()
archive = zipfile.ZipFile(mat_file[:-4] + '.zip', "w", zipfile.ZIP_DEFLATED)
archive.write('predictions.pkl', os.path.basename('predictions.pkl'))
archive.close()



