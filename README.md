# BuildEnv
This is a Dockerfile to build compile environment with ubuntu，it will install

- boost
- log4cxx
- python3
- folly
- fmt
- g++
- mysql

Above are main depency of my code, so I package them into a docker image by this Dockerfile.

Here is docker image in netease docker registry

```
docker pull hub.c.163.com/praying/flow:latest
```

