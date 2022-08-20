#! /bin/bash
KEY="ms9z-mx5s-fvjg-9tmf-93ap" 
rm xx.mp4
wget "https://rr5---sn-a5mekn6k.googlevideo.com/videoplayback?expire=1660983369&ei=6UMAY9zLKoiXsfIPwtm4-AU&ip=64.145.94.118&id=o-AKQEeYTcgUhRkRruGHnC_ep0cTix8AkKPOSyycB9L0IQ&itag=18&source=youtube&requiressl=yes&mh=0C&mm=31%2C26&mn=sn-a5mekn6k%2Csn-n4v7snl7&ms=au%2Conr&mv=m&mvi=5&pl=24&initcwndbps=1087500&spc=lT-Khr-7LKuF75LEWX-jSBcPVjy6pfU&vprv=1&mime=video%2Fmp4&ns=XKn0sUNZRx-5VJSDO_85Cc4H&gir=yes&clen=310269130&ratebypass=yes&dur=7867.222&lmt=1660680684334053&mt=1660961347&fvip=5&fexp=24001373%2C24007246&c=WEB&rbqsm=fr&txp=6219224&n=L2DRP7QodL3bZA&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cspc%2Cvprv%2Cmime%2Cns%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AG3C_xAwRAIgPocsj6GKVq_NXi1rBTgBhoFfu31ZXO-RchDKCSXRbWMCIAqWesRh2bPhQWB44WJsokh7abwbKf81zdmSC1o8l2gK&sig=AOq0QJ8wRQIhAKHQp16ya4eDAVbAmMYdcv1Ey2dWZcnJGJhXSGZIKzCfAiAKHiKDC79rfNzTLGVl-BXkGrrde1qDorfN6OZ_xtQ3vw%3D%3D" -O xx.mp4

ffmpeg -re \
      -i xx.mp4 \
      -pix_fmt yuvj420p \
      -x264-params keyint=48:min-keyint=48:scenecut=-1 \
      -b:v 4500k \
      -b:a 128k \
      -ar 44100 \
      -acodec aac \
      -vcodec libx264 \
      -preset medium \
      -crf 28 \
      -threads 4 \
      -f flv \
      rtmp://a.rtmp.youtube.com/live2/$KEY
