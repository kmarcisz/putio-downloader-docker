FROM python:3.8-alpine

RUN mkdir -p /conf \
	&& mkdir -p /data \
	&& mkdir -p /incomplete \
	&& apk add tzdata bash s6

RUN pip install -Iv putio-downloader==3.0.1

ADD files/start.sh /conf/start.sh

ADD files/putio-config.ini /conf/putio-config.ini

RUN chmod +x /conf/start.sh

WORKDIR /

VOLUME ["/data"]
VOLUME ["/conf"]

CMD ["/conf/start.sh"]
