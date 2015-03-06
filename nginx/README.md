# nginx on debian:jessie

About as simple as it gets, nginx installed on debian:jessie. Use this
if your app is based on debian:jessie also, so they can share base.

## Usage

```
docker run -d --name nginx \
  -v /etc/nginx/sites-enabled:/etc/nginx/sites-enabled \
  -v /var/www/html:/var/www/html \
  -v /var/log/nginx:/var/log/nginx \
  -p 80:80 -p 443:443 \
  rlister/nginx
```
