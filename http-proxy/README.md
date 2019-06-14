HTTP Proxy
==========

Support for local TLD's (e.g. `.dev`).

Setup
-----

```sh
# create .dev resolver
sudo mkdir -p /etc/resolver && echo "nameserver 127.0.0.1\nport 53535" > /etc/resolver/dev

# start as daemon
docker-compose up -d
```

Running Apps Locally
--------------------

```shell
# Use the local version
docker-compose -f docker-compose.host.yml up -d

# Run app on specific port
```
