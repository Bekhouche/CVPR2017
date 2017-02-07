#!/bin/bash

# Personality traits estimation
matlab -nodesktop -nosplash - nojvm -r "run personality_traits_estimation/main.m;quit;"
python personality_traits_estimation/mat2pkl.py

