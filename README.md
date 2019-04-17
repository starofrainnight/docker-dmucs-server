# docker-dmucs-server

Docker image for DMUCS Compilation Server

## Environments

- DISTCC_ALLOWEDNETS : Parameter of distccd's `--allow` option
- DMUCS_DISPATCHER: The IP address of dmucs dispatcher

## Ports

- 3632: Port of distcc server

## Start command

    docker run --restart=always -d -p 3632:3632 starofrainnight/dmucs-server
