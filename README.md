# Source codes for the ChaLearn Looking at People - Job Candidate Screening Competition
Info: The code is not optimized yet ..

## Scientific Use
If you find thiw work useful please cite the following documents:
```latex
@InProceedings{CVPRW2017,
title={Personality Traits and Job Candidate Screening via Analyzing Facial Videos},
author={Bekhouche, Salah Eddine and Dornaika, Fadi and Ouafi, Abdelkrim and Taleb-Ahmed, Abdelmalik},
booktitle={Computer Vision and Pattern Recognition Workshops (CVPRW), 2017 IEEE Conference on},
pages={1660–1663},
year={2017},
organization={IEEE},
doi={10.1109/CVPRW.2017.211}
}
```
AND
```latex
@article{ESWA2017,
title = “Pyramid Multi-Level Features for Facial Demographic Estimation “,
journal = “Expert Systems with Applications “,
volume = “80”,
pages = “297–310”,
year = “2017”,
issn = “0957-4174”,
doi = “http://dx.doi.org/10.1016/j.eswa.2017.03.030”,
url = “http://www.sciencedirect.com/science/article/pii/S0957417417301793”,
author = “SE. Bekhouche and A. Ouafi and F. Dornaika and A. Taleb-Ahmed and A. Hadid”
}
```


## Requirements
 - Operating System: Ubuntu or Debian
 - Matlab R2016a or later
 - OpenCV
 - Dlib (using GCC5)
 - Python2.7

## Setup
### Download the project
```
$ git clone https://github.com/Bekhouche/CVPR2017.git
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
