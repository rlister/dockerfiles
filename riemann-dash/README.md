# Riemann-Dash

[Riemann-Dash](https://github.com/aphyr/riemann-dash) is a
javascript, websockets-powered dashboard for
[Riemann](http://riemann.io/).

This dockerfile builds an S3-enabled image that can be configured
using environment variables. UI-configured dashboard settings can be
persisted in S3 and read by multiple riemann-dash containers.

This image also uses `thin` rather than `WEBrick`.

## Usage

```
docker run -it --name riemann-dash \
  -e WS_CONFIG=s3://my-bucket/config.json \
  -e AWS_ACCESS_KEY_ID=AECH8AEBUO0SHE7OOW9R \
  -e AWS_SECRET_ACCESS_KEY=OU0BA6AEZU2EID4SHOHZ2FEITIL4UGOHXIU7AEX1 \
  -p 4567:4567 \
  rlister/riemann-dash
```
