Useful commands:
- Show repositories

`curl -v -X GET http://127.0.0.1:5000/v2/_catalog -u registry-user | jq`
- Show name and tags

`curl -s -X GET http://127.0.0.1:5000/v2/_catalog | jq '.repositories[]' | sort | xargs -I _ curl -s -X GET http://127.0.0.1:5000/v2/_/tags/list`
- Find digest

`curl -v --silent -H "Accept: application/vnd.docker.distribution.manifest.v2+json" -X GET http://localhost:5000/v2/test_env/test-api/manifests/2058419 2>&1 | grep Docker-Content-Digest | awk '{print ($3)}'`
