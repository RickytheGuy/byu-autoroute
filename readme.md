# byu-autoroute

This is a docker container that is meant to make using the AutoRoute flood model easy, without having to install GDAL on your local machine. You will need the Linux-compiled versions of AutoRoute and FloodSpreader

Run the following lines of code in your terminal:

```
docker pull rickyrosas/byu-autoroute
```

To run the container, run the code below. Replace `Path\to\your\folder` with the path to the directory on your machine that contains the AutoRoute executables and files you need to want to run and use

```
docker run --rm -it -v Path\to\your\folder:/home/autoroute --name autoroute rickyrosas/byu-autoroute
```

You will need to update the permission of the AutoRoute and FloodSpreader files when you launch the Docker container like so:
```
chmod +x path/to/autoroute
```
