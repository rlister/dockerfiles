# dynamo-backup-to-s3

This is a minimal image built on Alpine Linux and nodejs to run
[dynamo-backup-to-s3](https://github.com/markitx/dynamo-backup-to-s3).

## Usage

```
$ docker run -d --name dynamo-backup-to-s3 \
  -e AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION \
  rlister/dynamo-backup-to-s3:latest \
  -b my-s3-bucket/path \
  table1,table2,...
```

It is generally preferable to deploy to an ec2 instance with a
suitable IAM role rather than passing AWS secrets in the environment.

## Options

```
$ docker run rlister/dynamo-backup-to-s3:latest -h

  Usage: dynamo-backup-to-s3 [options]

  Options:

    -h, --help                       output usage information
    -V, --version                    output the version number
    -b, --bucket <name>              S3 bucket to store backups
    -s, --stop-on-failure            specify the reporter to use
    -r, --read-percentage <decimal>  specific the percentage of Dynamo read capacity to use while backing up. default .25 (25%)
    -x, --excluded-tables <list>     exclude these tables from backup
    -i, --included-tables <list>     only backup these tables
    -p, --backup-path <name>         backup path to store table dumps in. default is DynamoDB-backup-YYYY-MM-DD-HH-mm-ss
    --aws-key                        AWS access key. Will use AWS_ACCESS_KEY_ID env var if --aws-key not set
    --aws-secret                     AWS secret key. Will use AWS_SECRET_ACCESS_KEY env var if --aws-secret not set
    --aws-region                     AWS region. Will use AWS_DEFAULT_REGION env var if --aws-region not set
```
