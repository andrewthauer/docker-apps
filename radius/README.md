# OpenRadius - Docker

Based on [`marcelmaatkamp/freeradius`](https://hub.docker.com/r/marcelmaatkamp/freeradius/)

## Testing

```sh
docker run --rm --network=host marcelmaatkamp/freeradius radtest testing password 192.168.10.10 0 SECRET
```
