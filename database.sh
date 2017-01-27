#!/bin/bash

seb_path=`pwd`

mkdir -p database

# train-annotation.zip
if [ ! -f database/annotation_training.pkl ]; then
if [ ! -f database/train-annotation.zip ]; then
   wget http://158.109.8.102/FirstImpressionsV2/train-annotation.zip -P $seb_path'/database'
fi
unzip -o 'database/train-annotation.zip' -d database
rm -f 'database/train-annotation.zip'
fi

# train-transcription.zip
if [ ! -f database/transcription_training.pkl ]; then
if [ ! -f database/train-transcription.zip ]; then
   wget http://158.109.8.102/FirstImpressionsV2/train-transcription.zip -P $seb_path'/database'
fi
unzip -o 'database/train-transcription.zip' -d database
rm -f 'database/train-transcription.zip'
fi

# train-1.zip
mkdir -p database/train-1
if [ ! -f database/train-1.zip ]; then
   wget http://158.109.8.102/FirstImpressionsV2/train-1.zip -P $seb_path'/database'
fi
unzip -o 'database/train-1.zip' -d database/train-1

for zipfile in database/train-1/*.zip; do
    filename=$(basename "$zipfile")
    filename="${filename%.*}"
    mkdir -p 'database/train-1/'$filename
    unzip -o $zipfile -d 'database/train-1/'$filename
    rm -f $zipfile
done

# train-2.zip
mkdir -p database/train-2
if [ ! -f database/train-2.zip ]; then
   wget http://158.109.8.102/FirstImpressionsV2/train-2.zip -P $seb_path'/database'
fi
unzip -o 'database/train-2.zip' -d database/train-2

for zipfile in database/train-2/*.zip; do
    filename=$(basename "$zipfile")
    filename="${filename%.*}"
    mkdir -p 'database/train-2/'$filename
    unzip -o $zipfile -d 'database/train-2/'$filename
    rm -f $zipfile
done

# train-3.zip
mkdir -p database/train-3
if [ ! -f database/train-3.zip ]; then
   wget http://158.109.8.102/FirstImpressionsV2/train-3.zip -P $seb_path'/database'
fi
unzip -o 'database/train-3.zip' -d database/train-3

for zipfile in database/train-3/*.zip; do
    filename=$(basename "$zipfile")
    filename="${filename%.*}"
    mkdir -p 'database/train-3/'$filename
    unzip -o $zipfile -d 'database/train-3/'$filename
    rm -f $zipfile
done

# train-4.zip
mkdir -p database/train-4
if [ ! -f database/train-4.zip ]; then
   wget http://158.109.8.102/FirstImpressionsV2/train-4.zip -P $seb_path'/database'
fi
unzip -o 'database/train-4.zip' -d database/train-4

for zipfile in database/train-4/*.zip; do
    filename=$(basename "$zipfile")
    filename="${filename%.*}"
    mkdir -p 'database/train-4/'$filename
    unzip -o $zipfile -d 'database/train-4/'$filename
    rm -f $zipfile
done

# train-5.zip
mkdir -p database/train-5
if [ ! -f database/train-5.zip ]; then
   wget http://158.109.8.102/FirstImpressionsV2/train-5.zip -P $seb_path'/database'
fi
unzip -o 'database/train-5.zip' -d database/train-5

for zipfile in database/train-5/*.zip; do
    filename=$(basename "$zipfile")
    filename="${filename%.*}"
    mkdir -p 'database/train-5/'$filename
    unzip -o $zipfile -d 'database/train-5/'$filename
    rm -f $zipfile
done

# train-6.zip
mkdir -p database/train-6
if [ ! -f database/train-6.zip ]; then
   wget http://158.109.8.102/FirstImpressionsV2/train-6.zip -P $seb_path'/database'
fi
unzip -o 'database/train-6.zip' -d database/train-6

for zipfile in database/train-6/*.zip; do
    filename=$(basename "$zipfile")
    filename="${filename%.*}"
    mkdir -p 'database/train-6/'$filename
    unzip -o $zipfile -d 'database/train-6/'$filename
    rm -f $zipfile
done

# val-transcription.zip
if [ ! -f database/val-transcription.pkl ]; then
if [ ! -f database/val-transcription.zip ]; then
   wget http://158.109.8.102/FirstImpressionsV2/val-transcription.zip -P $seb_path'/database'
fi
unzip -o 'database/val-transcription.zip' -d database
rm -f 'database/val-transcription.zip'
fi

# val-1.zip
mkdir -p database/val-1
if [ ! -f database/val-1.zip ]; then
   wget http://158.109.8.102/FirstImpressionsV2/val-1.zip -P $seb_path'/database'
fi
unzip -o 'database/val-1.zip' -d database/val-1

for zipfile in database/val-1/*.zip; do
    filename=$(basename "$zipfile")
    filename="${filename%.*}"
    mkdir -p 'database/val-1/'$filename
    unzip -o $zipfile -d 'database/val-1/'$filename
    rm -f $zipfile
done


# val-2.zip
mkdir -p database/val-2
if [ ! -f database/val-2.zip ]; then
   wget http://158.109.8.102/FirstImpressionsV2/val-2.zip -P $seb_path'/database'
fi
unzip -o 'database/val-2.zip' -d database/val-2

for zipfile in database/val-2/*.zip; do
    filename=$(basename "$zipfile")
    filename="${filename%.*}"
    mkdir -p 'database/val-2/'$filename
    unzip -o $zipfile -d 'database/val-2/'$filename
    rm -f $zipfile
done



