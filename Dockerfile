FROM python:3.8-alpine

RUN mkdir -p /conf \
	&& mkdir -p /conf-copy \
	&& mkdir -p /incomplete \
	&& mkdir -p /data \
	&& apk add --no-cache tzdata bash aria2 darkhttpd jq s6

RUN apk add --no-cache --virtual .install-deps curl unzip \
	&& mkdir -p /aria2-ng \
	&& curl -o /aria2-ng.zip -L $(curl -sX GET "https://api.github.com/repos/mayswind/AriaNg/releases/latest" | jq -r '.assets[0].browser_download_url') \
	&& unzip /aria2-ng.zip -d /aria2-ng \
	&& rm /aria2-ng.zip \
	&& apk del .install-deps

RUN pip install putio-downloader

ADD files/start.sh /conf-copy/start.sh
ADD files/aria2.conf /conf-copy/aria2.conf
ADD files/putio-config.ini /conf-copy/putio-config.ini

RUN chmod +x /conf-copy/start.sh

WORKDIR /

VOLUME ["/data"]
VOLUME ["/conf"]

EXPOSE 6800
EXPOSE 80

CMD ["/conf-copy/start.sh"]
