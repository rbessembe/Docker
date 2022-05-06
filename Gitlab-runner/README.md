Gitlab Runner in docker with docker executor and container limiting
[https://docs.gitlab.com/runner/register/index.html#docker]

```
docker-compose up -d
docker exec -it $container_name bash
gitlab-runner register
```
