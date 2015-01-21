# Riemann

[Riemann](http://riemann.io/) monitors distributed systems.

This dockerfile builds an extremely minimalist image for running
Riemann, based on busybox+java and nothing else.

## Usage

```
docker run -d -p 5555:5555 -p 5555:5555/udp -p 5556:5556 rlister/riemann
```

This will run with the default configuration from
`etc/riemann.config`. Custom config volumes should be mounted on
`/app/etc`, e.g.:

```
docker run -d \
  -p 5555:5555 \
  -p 5555:5555/udp \
  -p 5556:5556 \
  -v $HOME/riemann/etc:/app/etc \
  rlister/riemann
```
