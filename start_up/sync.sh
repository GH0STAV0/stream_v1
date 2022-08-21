#! /bin/bash
# KEY="ms9z-mx5s-fvjg-9tmf-93ap" 
rm xx.mp4
KEY="jxa6-aa71-ay6x-k6uk-bhdu"
mega-get https://mega.nz/file/lvxAxbzJ#SLA8Gcj0tKoC7vANTPeZ5uXiFgKLk6skpHH6LUnKOgA



ffmpeg -re -i xx.mp4 -c:v libx264 -b:v 750k -c:a copy -strict -2 -flags +global_header -bsf:a aac_adtstoasc -bufsize 2100k -f flv rtmp://a.rtmp.youtube.com/live2/$KEY
