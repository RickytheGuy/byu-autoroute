# byu-autoroute

This is a docker container that is meant to make using the AutoRoute flood model easy, without having to install GDAL on your local machine. You will need the Linux-compiled versions of AutoRoute and FloodSpreader

Run the following lines of code in your terminal:

```
docker pull rickyrosas/byu-autoroute
```

To run the container, run the code below. Replace `Path\to\your\folder` with the path to the directory on your machine that contains the AutoRoute executables and files you need to run and use
```
docker run -it -v Path\to\your\folder:/home/autoroute rickyrosas/byu-autoroute
```
