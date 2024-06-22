# Aapanel

Aapanel docker compose file to customize

# Commands

## config

Rename `.env.example` to `.env` and chage the variables

## run

```
make build
make mkdir
make fix_permissions
make up
make bt
14
```

## record changes to aapanel in the docker image

```
make commit
```

## stop

```
make rm
```
To "make up" twice, you need "make rm" first.


## Read this:

https://hub.docker.com/r/antonio24073/aapanel

https://github.com/antonio24073/aapanel-updater
