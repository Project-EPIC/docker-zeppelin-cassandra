# Zeppelin Cassandra Docker image

Zeppelin 0.7.1 docker image based on Google's Zeppelin image. Added cassandra spark library compatibility. Main purpose was to use it in a Kubernets cluster.

## Run

Here you can find the most commom run configuration. 

```
docker run -d -p 0.0.0.0:8080:8080 -e ZEPPELIN_PORT=8080 -e MASTER="spark://master:7077" -t projectepic/zeppelin-cassandra:latest
```

This runs on detached mode, setting spark master url, the zeppelin port and exposing it to the outside

### Ports exposable

- `8080`: Zeppelin web server

### Volumes available to mount

- `/opt/zeppelin/notebook/`: This is where the notebooks are stored

Check out this docker cheatsheet to add volumes or ports: [https://github.com/wsargent/docker-cheat-sheet](https://github.com/wsargent/docker-cheat-sheet)


## Build

To mantain this image, you can run:

- `make build`: This builds the image in the TAG set in the `Makefile`
- `make push`: Builds and pushes image to Docker Hub (you will need to login to DockerHub on your machine before running this)
