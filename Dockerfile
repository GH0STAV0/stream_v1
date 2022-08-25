FROM php:7.4-apache

ENV HOME=/root \
    TERM=xterm \
    SEC_YOU="wq19-cbr5-sva0-935w-191s" \
    DEBIAN_FRONTEND=noninteractive \
    STARTUPDIR=/dockerstartup 



RUN apt-get update \
    && apt-get install -q -y vsftpd curl tini supervisor ffmpeg wget #\
    # && apt-get clean \
    # && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 2>/dev/null >/dev/null


# RUN apt update
# RUN apt install vsftpd curl -y

#COPY /etc/vsftpd.conf /etc/vsftpd.conf.backup 00000
ADD ./etc/ /etc/

COPY ./etc/sync.conf /etc/supervisor/conf.d/
COPY ./etc/re.conf /etc/supervisor/conf.d/
COPY ./etc/apashe.conf /etc/supervisor/conf.d/
COPY ./etc/supervisor/supervisord.conf /etc/supervisor/

COPY cnf/vsftpd.conf /etc/vsftpd.conf

COPY src/ /var/www/html/

COPY ./start_up/startup.sh "${STARTUPDIR}"/
COPY ./start_up/sync.sh "${STARTUPDIR}"/
COPY ./start_up/rerun.sh "${STARTUPDIR}"/
COPY ./start_up/pre-install.sh "${STARTUPDIR}"/
RUN find "${STARTUPDIR}"/ -name '*.sh' -exec chmod a+x {} +
# RUN $STARTUPDIR/sync.sh
RUN $STARTUPDIR/pre-install.sh

RUN userdel www-data 


RUN addgroup www-data 
RUN useradd -m -s /bin/bash -g root www-data
RUN echo "www-data:12pass12" | /usr/sbin/chpasswd



# RUN set -x \
#     && addgroup -g 33 -S www-data
     # \
    # && adduser -u 33 -D -S -G www-data www-data
# RUN addgroup -S -g 33 www-data \
#  && adduser -S -D -u 33 -s /sbin/nologin -h /var/www -G www-data www-data \
#  && chown -R www-data:www-data /var/www/

RUN chown -R www-data:www-data /var/www

WORKDIR /var/www
EXPOSE 21 80 9001
# USER www-data
ENTRYPOINT [ "/usr/bin/tini", "--", "/dockerstartup/startup.sh" ]


#CMD ["php","-S","0.0.0.0:8001","-t","html"]
