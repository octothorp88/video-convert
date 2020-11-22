#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for f in *.[AaWw]*
do
    EXT=$(echo $f|cut -d'.' -f2 )
    NAME=$(echo $f|cut -d'.' -f1 )
    #avconv -i "$f" -c:v libx264 -c:a copy "${NAME}.mp4"
    #avconv -i "$f" -c:v libx264 -acodec aac -strict experimental  "${NAME}.mp4"
    avconv -i "$f" -c:v libx264 -acodec aac -strict experimental -r 24 -b 255k -ar 44100 -ab 59k "${NAME}.mp4"
    echo $EXT
  done
IFS=$SAVEIFS

#avconv -i $f -c:v libx264 -c:a copy ${NAME}.mp4
