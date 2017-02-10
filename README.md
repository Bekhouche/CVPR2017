# Source codes for the ChaLearn Looking at People - Job Candidate Screening Competition
Info: The code is not optimized yet ..

## Requirements
 - Operating System: Ubuntu or Debian
 - Matlab R2016a or later
 - OpenCV
 - Dlib (using GCC5)
 - Python2.7

## Setup
### Download the project
```
$ git clone https://github.com/Bekhouche/FirstImpressionsV2.git
```

### Download and prepare data
You have to execute this bash script (database.sh) in Terminal, so you can type this instruction in Terminal:
```
$ ./database.sh
```
In case you have a problem with permission; you have to execute this command in terminal:
```
$ sudo chmod -R 777 database.sh
```

### Face preprocessing phase
Same as above, execute this bash script (face_preprocessing.sh)
```
$ ./face_preprocessing.sh
```

### Feature extraction phase
Execute this bash script (feature_extraction.sh)
```
$ ./feature_extraction.sh
```
In case you want to skip the last two phases. Download the features and the relative files from [Mendeley](https://data.mendeley.com/datasets/nrcd6h3kdx/draft?a=a279a3f4-9c63-4f77-a691-d14a2c47f61b) or [Researchgate](https://www.researchgate.net/publication/313557489_Pyramid_Multi-Level_Features_for_Apparent_Personality_Analysis).
You have to put database.mat in database folder, for the features files download PML_BSIF_7.mat and PML_LPQ_7.mat put them in feature_extraction/features path.


### Personality traits estimation phase
Execute this bash script (personality_traits_estimation.sh)
```
$ ./personality_traits_estimation.sh
```
After running the script, you will get "predictions.pkl". This file can be used to get the scores.

## Licence
[The PML-FirstImpressionsV2 code is licensed under the MIT License.](https://github.com/Bekhouche/FirstImpressionsV2/blob/master/LICENSE.md)
