# Docker SSH Agent

Share an ssh-agent to other containers

See [ssh-agent](https://github.com/whilp/ssh-agent)

- https://github.com/whilp/ssh-agent

## Setup

```sh
# You can create a `.env` file with the `SSH_KEY_FILE` environment variable to specify a different path.
./run.sh

# Manually override the SSH_KEY_FILE
SSH_KEY_FILE=path/to/key ./run.sh
```
