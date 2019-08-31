# Git Server

See [jkarlos/git-server-docker](https://hub.docker.com/r/jkarlos/git-server-docker/)

- https://git-scm.com/book/en/v2/Git-on-the-Server-Setting-Up-the-Server
- https://hub.docker.com/r/jkarlos/git-server-docker/

## FAQ

How to clone a repo?

```sh
git clone ssh://git@my-server/git-server/repos/my-repo.git
```

How to initalize a new repo

```sh
docker-compose run --rm server git init --bare /git-server/repos/my-repo.git
```
