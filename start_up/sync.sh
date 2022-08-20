#! /bin/bash
 
# apt-get update 
# apt-get install ffmpeg -y

wget "https://rr7---sn-5abxgpxuxaxjvh-cawe.googlevideo.com/videoplayback?expire=1660968887&ei=VwsAY5zBN7WC6dsPi5aYwAU&ip=69.16.157.59&id=o-ALkI91UwHAnCw73iMLzVHVnFyZ8b4GRsApP1RO6RjAH_&itag=22&source=youtube&requiressl=yes&spc=lT-KhiOUPgaIBkSS3TpDT_LaQS3ed2k&vprv=1&mime=video%2Fmp4&ns=YX0CB0JgVMN2q2kLS5rLprgH&cnr=14&ratebypass=yes&dur=28055.208&lmt=1660416973461678&fexp=24001373,24007246&c=WEB&rbqsm=fr&txp=4432434&n=9xp2rnEoBkTMCA&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Cmime%2Cns%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRQIhAI--zDeKngzH1_WxZDoc8nkrsqWZcy0jvIZ2QQeaFmodAiBh27L_DLugBzthUTU0a6asNCqJi0as_-VoOe6zETKuCw%3D%3D&title=%D8%B3%D9%88%D8%B1%D8%A9%20%D8%A7%D9%84%D8%A8%D9%82%D8%B1%D8%A9%20%D8%A7%D9%84%D9%82%D8%A7%D8%B1%D8%A6%20%D8%A7%D9%84%D8%B4%D9%8A%D8%AE%20%D9%85%D8%A7%D9%87%D8%B1%20%D8%A7%D9%84%D9%85%D8%B9%D9%8A%D9%82%D9%84%D9%8A%20%D8%A7%D9%84%D9%82%D8%B1%D8%A7%D9%86%20%D8%A7%D9%84%D9%83%D8%B1%D9%8A%D9%85%20%D9%85%D8%A8%D8%A7%D8%B4%D8%B1%20%20Surat%20Al-Baqarah%20Quran%20Recitation&redirect_counter=1&rm=sn-hpa6l7z&req_id=6f616d3dbd73a3ee&cms_redirect=yes&cmsv=e&ipbypass=yes&mh=17&mip=105.111.53.233&mm=31&mn=sn-5abxgpxuxaxjvh-cawe&ms=au&mt=1660951276&mv=m&mvi=7&pl=21&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwQwIfUvIA1fAN2r1EbdqAf-PtesHJwwsKrLzFZTdhlHxPbAIgEYAO1GJY--OBQTvG_rlnJtXXoxYo74FUzhiMqpYcs_Y%3D" -O xx.mp4

# mv file_example_MP4_1920_18MG.mp4 xx.mp4

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