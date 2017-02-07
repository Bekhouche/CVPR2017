#!/bin/bash

# Face Detection and Landmark Localization
python preprocessing/landmarks.py
matlab -nodesktop -nosplash - nojvm -r "run database/csv2mat.m;quit;"

# Face Alignment
matlab -nodesktop -nosplash - nojvm -r "run face_preprocessing/main.m;quit;"

