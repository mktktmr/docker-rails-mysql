# docker-rails-mysql

## Summary

This container based on ubuntu 16.04 and includes following component.

* rails 4.2.7
* ruby 2.3.1
* mysql 5.1

## Installation

The easiest way to get this docker image installed is to pull the latest version
from the Docker registry:

```bash
$ docker pull mktktmr/docker-rails-mysql
```

If you'd like to build the image yourself then:

```bash
$ git clone https://github.com/mktktmr/docker-rails-mysql.git
$ cd docker-rails-mysql
$ docker build -t mktktmr/docker-rails-mysql .
```

## Usage

To spawn a new instance of Rails on port 3000.  The -p 3000:3000 maps the internal docker port 3000 to the outside port 3000 of the host machine.

```bash
$ docker run -it --name rails -p 3000:3000 mktktmr/docker-rails-mysql
```

After starting the docker-rails-mysql check to see if it started and the port mapping is correct.  This will also report the port mapping between the docker container and the host machine.

```bash
$ docker ps

0.0.0.0:3000 -> 3000/tcp rails
```

You can the visit the following URL in a browser on your host machine to get started:

```
http://localhost:3000
```
