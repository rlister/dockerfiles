# dynamo-backup-to-s3

This is a minimal image built on Alpine Linux and nodejs to run
[dynamo-backup-to-s3](https://github.com/markitx/dynamo-backup-to-s3).

## Usage

```
docker run -d --name dynamo-backup-to-s3 \
  -e AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION \
  rlister/dynamo-backup-to-s3:latest \
  -b my-s3-bucket/path \
  table1,table2,...
```

It is generally preferable to deploy to an ec2 instance with a
suitable IAM role rather than passing AWS secrets in the environment.
