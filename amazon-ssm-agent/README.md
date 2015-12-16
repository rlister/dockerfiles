# amazon-ssm-agent

This is a simple installation on debian of the
[AWS EC2 Run Command agent](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/execute-remote-commands.html).

Running this container on an ec2 instance with correct IAM permissions
will allow the running of commands _inside the container_.

## Example uses

### Run systemd commands on CoreOS

```
docker run \
  -v /var/run/dbus:/var/run/dbus \
  -v /run/systemd:/run/systemd \
  rlister/amazon-ssm-agent:latest
```