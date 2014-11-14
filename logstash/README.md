# logstash

This is intended to be the simplest possible working build of
logstash. Building the dockerfile does the following:

- download logstash tarball
- unpack to /app
- install contrib plugins

## Download and test

Download the image and check its version:

```
docker run -it rlister/logstash version
```

Run a simple agent to send stdin to stdout:

```
docker run -it rlister/logstash agent -e 'input { stdin { } } output { stdout {} }'
hello world
2014-11-14T07:37:27.719+0000 c99421891296 hello world
```

If you want to poke around in a container, override the default
entrypoint:

```
docker run -it --entrypoint=bash rlister/logstash
```

## Reduce memory usage

For running logstash as a simple shipper, you may want to limit
footprint as follows:

```
export LS_HEAP_SIZE=128m
docker run -d -e LS_HEAP_SIZE rlister/logstash ...
```

## Bindmount your own config

```
echo 'input { stdin { } } output { stdout {} }' > /tmp/logstash.conf
docker run -d \
  -v /tmp/logstash.conf:/app/logstash.conf \
  rlister/logstash agent -f logstash.conf
```

## Bindmount a local log directory to ship it

```
echo 'input {file {path => "/log/*.log"}} output { stdout {} }' > /tmp/logstash.conf
docker run -d \
  -v /tmp/logstash.conf:/app/logstash.conf \
  -v /var/log:/log \
  rlister/logstash agent -f logstash.conf
```
