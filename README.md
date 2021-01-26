Scrapyd
==========

Scrapyd is an application for deploying and running Scrapy spiders. It enables you to deploy (upload) your projects and control their spiders using a JSON API.

https://scrapyd.readthedocs.io/en/stable/

This docker image is for scrapyd in its own container. It accepts environment variables to update the configuration file.

Volumes are specified for for persistence.

# How to use this image

```console
$ docker run --name some-scrapyd -d zentekmx/scrapyd
```

Then, access it via `http://localhost:6800` or `http://host-ip:6800` in a browser.

Example `docker-compose.yml` for `scrapyd`:

```yaml
version: '3'

services:

  scrapyd:
    image: zentekmx/scrapyd
    ports:
      - 6800:6800
    volumes:
      - scrapyd-volume:/scrapyd:Z

volumes:
  scrapyd-volume:      
```

Run `docker-compose up`, wait for it to initialize completely, and visit `http://localhost:6800` or `http://host-ip:6800`.
