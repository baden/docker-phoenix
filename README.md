# docker-phoenix

My base Phoexin docker image.

This is not phoenix, just:
- elixir
- npm
- preinstalled hex & rebar & phoenix_new

## Build local image

```
  make build
```

## Run local image

```
  make run
```

You can create empty project like:

```
  mix phoenix.new myproject
```

## Run image from [DockerHUB](https://hub.docker.com/r/baden/phoenix/)

No need clone repository. You can use this method from anywhere.

```
  docker run -it --rm baden/phoenix
```

## Run with user privilegies:

```
docker run -it --rm -e USER_ID=`id -u` -e GROUP_ID=`id -g` -v `pwd`:/home/composer/code -w /home/composer/code baden/phoenix
```
