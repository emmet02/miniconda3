# Miniconda3 Docker File for setting up on Unraid

Docker images for Anaconda/Miniconda that are available from Docker Hub:

https://hub.docker.com/r/continuumio/

Documentation for Anaconda Integrations, including Docker:

https://docs.anaconda.com/anaconda/user-guide/tasks/docker/

I've simply taken a snapshot of the DockerFile for Debian @ today's date, and adjusted it for my requirements

https://hub.docker.com/r/continuumio/miniconda3


Steps to get running

 docker pull emmet00/miniconda3

 docker run -i -t emmet00/miniconda3 /bin/bash


# TODO
* Need to learn what to do in Unraid to expose shell via http - possible that examples exist elsewhere?
* Need to be able to expose created environments to other dockers (pycharm etc)
* Look to find a smaller build to use as a base?
* Resolve the -it run requirements for unraid (working locally no problem)