# SonarQube

See [SonarQube Docker](https://hub.docker.com/_/sonarqube)

- https://www.sonarqube.org/
- https://hub.docker.com/_/sonarqube/

## Running

Login with `admin/admin`.

## Run Scans

```bash
docker-compose run --rm --service-ports sonar-scanner bash

# inside the container
sonar-scanner -Dsonar.host.url=http://sonarqube:9000 -Dsonar.projectKey=test
```
