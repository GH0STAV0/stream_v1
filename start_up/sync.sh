#! /bin/bash
 
# apt-get update 
# apt-get install ffmpeg -y

wget https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_1920_18MG.mp4
mv file_example_MP4_1920_18MG.mp4 xx.mp4

#
# Diffusion youtube avec ffmpeg

# Configurer youtube avec une résolution 720p. La vidéo n'est pas scalée.

VBR="2500k"                                    # Bitrate de la vidéo en sortie
FPS="30"                                       # FPS de la vidéo en sortie
QUAL="medium"                                  # Preset de qualité FFMPEG
YOUTUBE_URL="rtmp://a.rtmp.youtube.com/live2"  # URL de base RTMP youtube

SOURCE="xx.mp4"              # Source UDP (voir les annonces SAP)
KEY="7h61-5gwb-zmy2-wbgk-fp4h"                                     # Clé à récupérer sur l'event youtube

ffmpeg \
    -i "$SOURCE" -deinterlace \
    -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale 3 -b:a 712000 -bufsize 512k \
    -f flv "$YOUTUBE_URL/$KEY"