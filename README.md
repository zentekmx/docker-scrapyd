Scrapyd
==========

Scrapyd is an application for deploying and running Scrapy spiders. It enables you to deploy (upload) your projects and control their spiders using a JSON API.

https://scrapyd.readthedocs.io/en/stable/

This docker image is for scrapyd in its own container. It accepts environment variables to update the configuration file.

Volumes are specified for for persistence.

# How to use this image

## Start a Scrapyd server

```console
$ docker run --name some-scrapyd -d zentekmx/scrapyd
```

Then, access it via `http://[docker host]:6800` in a browser.

## Volumes

To persist data between launches, you can mount the volume `/scrapyd` somewhere on your Docker host.

## docker-compose

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

Run `docker-compose up`, wait for it to initialize completely, and visit `http://[docker host]:6800`.

### Deploying a project

Deploying your project involves eggifying it and uploading the egg to Scrapyd via the `addversion.json` endpoint.
The easiest way is to use the `scrapyd-deploy`. You can use following example:

1. Create egg file - Make sure you're in the root directory of the tutorial project, where the `scrapy.cfg` resides.

```console
scrapyd-deploy --build-egg <myproject>.egg
```

2. Deploy egg file version - change <myproject> with your project name

```console
curl http://[docker host]:6800/addversion.json -F project=<myproject> -F version=r1 -F egg=@<myproject>.egg
```

You can check the status of the project/spiders and logs on the scrapyd web GUI located at `http://[docker host]:6800`.

### Scheduling a spider

To schedule the execution of some spider, use the scrapyd API:

```console
curl http://[docker host]:6800/schedule.json -d project=<myproject> -d spider=<somespider>
```

# Feedback

## Issues

If you have any problems with or questions about this image, please file an issue on the [GitHub repository](https://github.com/zentekmx/docker-scrapyd/issues).

## Contributing

Pull requests welcome :-)
