#!/bin/bash
INPUTFILE=$1
ffmpeg -loop 1 -i $INPUTFILE -c:v libx264 -t 5 -pix_fmt yuv420p -vf scale=1280:720 $INPUTFILE.mp4