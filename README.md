# What is Biotooop?

Biotooop is an open source in-house networking system.

# Feature
- [x] Creating members
- [x] Selecting likes 
- [ ] Grouping members by likes

# How to use this image

```console
$ docker run --name some-biotooop --link some-mysql:mysql -d biotooop/biotooop
```

The following environment variables are also honored for configuring your Biotooop instance:

-	`-e DB_HOST=...`
-	`-e DB_USER=...` (defaults to "root")
-	`-e DB_PASSWORD=...` (defaults to the value of the `MYSQL_ROOT_PASSWORD` environment variable from the linked `mysql` container)
-	`-e DB_DATABASE=...` (defaults to "biotooop")

If you'd like to be able to access the instance from the host without the container's IP, standard port mappings can be used:

```console
$ docker run --name some-biotooop --link some-mysql:mysql -p 8080:8080 -d biotooop/biotooop
```

Then, access it via `http://localhost:8080` or `http://host-ip:8080` in a browser.

If you'd like to use an external database instead of a linked `mysql` container, specify the hostname and port with `DB_HOST` along with the password in `DB_PASSWORD` and the username in `DB_USER` (if it is something other than `root`):

```console
$ docker run --name some-biotooop -e DB_HOST=10.1.2.3:3306 \
    -e DB_USER=... -e DB_PASSWORD=... -d biotooop/biotooop
```

## ... via [`docker-compose`](https://github.com/docker/compose)

Example `docker-compose.yml` for `biotooop`:

```yaml
version: '2'

services:

  biotooop:
    image: biotooop/biotooop
    environment:
      DB_HOST: mysql
      DB_PASSWORD: example
    depends_on:
      - mysql
    ports:
      - 8080:8080

  mysql:
    image: mysql:5.7
    environment:
      MYSQL_ROOT_PASSWORD: example
      MYSQL_DATABASE: biotooop
```

Run `docker-compose up -d`, wait for it to initialize completely, and visit `http://localhost:8080` or `http://host-ip:8080`.

# Supported Docker versions

This image is officially supported on Docker version 1.13.1.

Support for older versions (down to 1.6) is provided on a best-effort basis.

Please see [the Docker installation documentation](https://docs.docker.com/installation/) for details on how to upgrade your Docker daemon.

# User Feedback

## Issues

If you have any problems with or questions about this image, please contact us through a [GitHub issue](https://github.com/biotooop/biotooop/issues).

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub issue](https://github.com/biotooop/biotooop/issues), especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.
