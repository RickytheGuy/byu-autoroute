# byu-autoroute

This is a docker container that is meant to make using the AutoRoute flood model easy, without having to install GDAL on your local machine.

Run the following lines of code in your terminal:

```
docker pull byu-autoroute
docker cp /path/to/AutoRoute byu-autoroute:/home/autoroute/exes
docker cp /path/to/FloodSpreader byu-autoroute:/home/autoroute/exes
```
Note that you must copy your own linux copies of AutoRoute and FloodSpreader to the docker container.

To use the container, you may run `docker run -it byu-autoroute`, and then you may use AutoRoute and FloodSpreader as you please.