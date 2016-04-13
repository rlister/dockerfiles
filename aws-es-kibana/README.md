# aws-es-kibana

Simple alpine-based Dockerfile for
[aws-es-kibana](https://www.npmjs.com/package/aws-es-kibana) from
`npm` ([github](https://github.com/santthosh/aws-es-kibana)), which is
based on
[this gist](https://gist.github.com/nakedible-p/ad95dfb1c16e75af1ad5).

Runs a simple HTTP proxy on `localhost:9200` that handles
request-signing for an IAM user or instance role that has access to an
[AWS Elasticsearch](https://aws.amazon.com/elasticsearch-service/) domain.