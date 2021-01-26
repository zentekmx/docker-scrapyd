FROM python:3.6-alpine
LABEL maintainer="Zentek Servicios Tecnologicos"
LABEL description="Application for deploying and running Scrapy spiders."

ENV PYTHONUNBUFFERED 1

RUN set -ex && apk --no-cache --virtual .build-deps add build-base g++ bash curl gcc libgcc tzdata psutils linux-headers openssl-dev libffi-dev libxml2-dev libxslt-dev

RUN ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
RUN echo "America/Mexico_City" > /etc/timezone

RUN pip install pip==20.2.4
RUN pip install scrapyd

RUN mkdir /etc/scrapyd
COPY scrapyd.conf /etc/scrapyd/

VOLUME /scrapyd
EXPOSE 6800

ENTRYPOINT ["scrapyd"]
