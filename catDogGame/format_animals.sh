#!/bin/bash


DIR_NAME=$1

if [ ! -d $DIR_NAME ]
then
    mkdir $DIR_NAME
fi

if [ ! -d "$DIR_NAME"_mono ]
then
    mkdir "$DIR_NAME"_mono
fi

if [ ! -d animal_features ]
then
    mkdir animal_features
fi

for i in {1..20}
do
    ch_wave "$DIR_NAME"/sound$i.wav -scaleN 0.65 -c 0 -F 16000 -o "$DIR_NAME"_mono/formatted_sound$i.wav
done
python extract_feats_dir.py "$DIR_NAME"_mono
for i in {1..20}
do
    cp "$DIR_NAME"_mono/formatted_sound$i.mfcc animal_features/"$DIR_NAME"_$i.mfcc
done

echo "Successfully formatted $DIR_NAME s"