#!/bin/bash

# Face Detection and Landmark Localization
python face_preprocessing/landmarks.py
matlab -nodesktop -nosplash - nojvm -r "run face_preprocessing/csv2mat.m;quit;"

# Face Alignment
matlab -nodesktop -nosplash - nojvm -r "run face_preprocessing/main.m;quit;"

