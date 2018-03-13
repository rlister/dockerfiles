# Hastebin

[Hastebin](https://github.com/seejohnrun/haste-server) is a simple
pastebin, which can be installed on a protected network.

This dockerfile builds an image that can be configured using
environment variables. This is done by writing `config.js` at runtime
from interpolated variables in `app.sh`.

See `app.sh` for variable names.

## Example use

> `STORAGE_TYPE` is set to `file` by default so you can quickly be up and running!

Writing pastes to a mounted local volume:

```
docker run --name hastebin -d -p 7777:7777 -e STORAGE_TYPE=file -v /data:/app/data rlister/hastebin
```

Writing pastes to redis:

```
docker run --name redis -d redis
docker run --name hastebin -d -p 7777:7777 --link redis:redis -e STORAGE_TYPE=redis -e STORAGE_HOST=redis rlister/hastebin
```

## Example docker-compose

Create an empty directory and create a `docker-compose.yml` file with
the contents from the above link. Then run `docker-compose up -d`. It
will create a folder in the directory called `data` which will be the
persistent storage. You can then safely restart the containers and the
data will be saved. To delete the persistent data - just remove/rename
the directory and a new empty one will be created next time you spin
up the containers.

```
version: "3"
services:
  hastebin:
    image: rlister/hastebin
    environment:
      STORAGE_TYPE: redis
      STORAGE_HOST: hastebinredis
    ports:
     - "80:7777"
  hastebinredis:
    image: redis
    volumes:
      - ./data:/data
entrypoint: redis-server --appendonly yes
```