# kibana4

[Kibana4](http://www.elasticsearch.org/overview/kibana/) that can be
configured using environment variables.

## Usage

Download and view the default config file:

```
docker run rlister/kibana4 cat config/kibana.yml
```

Settings can be overridden using environment variables of the same
name, but uppercased:

For example, to link and connect to an elasticsearch container (using
the linked `/etc/hosts` entry):

```
docker run -d --name elasticsearch dockerfile/elasticsearch
docker run -d --name kibana4 --link elasticsearch:elasticsearch -e ELASTICSEARCH_URL=http://elasticsearch:9200 -p 5601:5601 rlister/kibana4
```

You should now be able to use your dashboard at
`http://localhost:5601`.
