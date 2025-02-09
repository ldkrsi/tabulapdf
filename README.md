# Tabula Docker Image

This repository contains the Dockerfile and GitHub Actions workflow to build and push a Docker image for [Tabula](https://github.com/tabulapdf/tabula).

## Usage

To run the Tabula Docker container:

```sh
docker run -p 8080:8080 ghcr.io/ldkrsi/tabulapdf:master
```

## Building the Image

To build the Docker image locally:

```sh
docker build -t tabula .
```