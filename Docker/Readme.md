# Favorite Docker Commands

## Docker Run
```
docker run -d <name> //-d is background
docker run -it ubuntu <cmd>
docker run -it ubuntu bash
docker run -it --rm alpine /bin/ash
docker run -e <env var>=<value> // pass an environment variable
docker run -d // run in detached mode, restart when host is rebooted
docker run --restart // restarts the container when the hose is restarted
docker run -it --rm --name <name> <container> /bin/bash
docker run --rm -it -v /:/vm-root registry:2 ls -l /vm-root/var/lib/docker/volumes/tmtest/_data // view docker volume data
docker run --rm -it -v tmtest:/app ubuntu:latest
docker run --rm -it -v "$(pwd):/app" ubuntu:latest // I think this is linux only
docker run --rm -it -v //c/tmp/dockerdir:/app ubuntu:latest // windows directory mount
docker run --rm -it -v "//c/<dir>:/app" mcr.microsoft.com/dotnet/sdk:5.0 bash
```

## Docker Execute
```
docker exec -it edgeAgent cmd // exec runs a command on a running container
```

## Docker Volumes
```
docker -v <host-dir>:<container-dir> // map host directory to a container directory, $PWD for current directory
docker volume create <volume name>
docker volume list
```

## Docker Logs
```
docker logs <friendly-name|container-id> // shows logs stdout and stderr
```

## Docker Compose
```
docker compose -f <yml file> up // by default runs in debug mode with output to the console. Cntrl C will terminate
docker compose -f <yml file> up -d // detached/daemen mode
docker compose -f <yml file> down // stop
docker compose -f <yml file> up <cont1> < cont2> // start individual containers. Will stop and start the containers
docker compose -f <yml file> build <cont> // build a container
docker compose run <cont> yarn install
docker compose --force-rm // remove intermediary images
docker compose --no-cache  // don't use any cached/downloaded/built versions of anything
```

## Docker Network
```
docker network create <network name> // create an internal network. Can create as many as needed
docker network rm <network name>
```

## Miscellaneous
```
docker stop <container>
docker images -a
docker rmi -f <image> <image>  // remove an image
docker -H "npipe:////./pipe/iotedge_moby_engine" <docker params on Mobi on Windows>
docker inspect <friendly-name|container-id>
docker search <name>
docker port <name> <port> // find which port was assigned
docker system prune // clean up any resources — images, containers, volumes, and networks — that are dangling (not associated with a container)
docker -p <host port>:<container port> // map ports
```
