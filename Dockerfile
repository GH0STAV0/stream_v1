FROM php:7.4-apache

ENV HOME=/root \
    TERM=xterm \
    DEBIAN_FRONTEND=noninteractive \
    STARTUPDIR=/dockerstartup 



RUN apt-get update \
    && apt-get install -q -y vsftpd curl tini supervisor #\
    # && apt-get clean \
    # && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 2>/dev/null >/dev/null


# RUN apt update
# RUN apt install vsftpd curl -y

#COPY /etc/vsftpd.conf /etc/vsftpd.conf.backup 00000
ADD ./etc/ /etc/

COPY ./etc/conf.d/sync.conf /etc/supervisor/conf.d/

COPY cnf/vsftpd.conf /etc/vsftpd.conf

COPY src/ /var/www/html/

COPY ./start_up/startup.sh "${STARTUPDIR}"/
COPY ./start_up/sync.sh "${STARTUPDIR}"/
RUN find "${STARTUPDIR}"/ -name '*.sh' -exec chmod a+x {} +
RUN $STARTUPDIR/sync.sh


RUN chown -R www-data:www-data /var/www

WORKDIR /var/www
EXPOSE 21 80
#USER www-data
ENTRYPOINT [ "/usr/bin/tini", "--", "/dockerstartup/startup.sh" ]


#CMD ["php","-S","0.0.0.0:8001","-t","html"]
