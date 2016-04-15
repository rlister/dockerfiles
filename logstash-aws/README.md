# logstash-aws

Image based on [Alpine Linux](http://www.alpinelinux.org/) with
logstash and
[AWS logstash output plugin](https://github.com/awslabs/logstash-output-amazon_es),
which will sign output events in order to send to
[AWS Elasticsearch Service](https://aws.amazon.com/elasticsearch-service/).

The image is intended to be as lightweight as possible, but hey, it's java.

## Usage

```
$ docker pull rlister/logstash-aws:2.3.1

$ docker run  rlister/logstash-aws:2.3.1 version
logstash 2.3.1

$ docker run -it rlister/logstash-aws:2.3.1 -e 'input { stdin { } } output { stdout {} }'
Settings: Default pipeline workers: 2
Pipeline main started
hello world
2016-04-15T03:31:37.718Z 732122cde820 hello world
```