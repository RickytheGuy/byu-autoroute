# Use a base image with Linux
FROM --platform=linux/amd64 ubuntu:20.04

# Set working directory, copy files
WORKDIR /home/autoroute
COPY . .

# Change permissions
# RUN chmod +x /home/autoroute/exes/autoroute
# RUN chmod +x /home/autoroute/exes/FloodSpreader

# Install necessary packages
RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

# Download and install Miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda && \
    rm Miniconda3-latest-Linux-x86_64.sh

# Add Conda to the PATH environment variable
ENV PATH="/opt/conda/bin:$PATH"
ENV PATH="/home/autoroute/exes:${PATH}"

# Set up Conda channels and create a Conda environment
RUN conda config --add channels conda-forge && \
    conda config --set channel_priority strict && \
    conda update -y conda && \
    conda init bash && \
    conda create -y --name autoroute gdal=3.5.1

# Activate the Conda environment
# RUN echo "alias autoroute='/home/autoroute/exes/autoroute'" >> ~/.bashrc
# RUN echo "alias floodspreader='/home/autoroute/exes/FloodSpreader'" >> ~/.bashrc
RUN echo "conda activate autoroute" >> ~/.bashrc

# Add environment variables for autoroute
ENV LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$LD_LIBRARY_PATH
ENV PATH=$CONDA_PREFIX/include:$PATH
ENV PKG_CONFIG_PATH=$CONDA_PREFIX/lib/pkgconfig


CMD ["/bin/bash"]
