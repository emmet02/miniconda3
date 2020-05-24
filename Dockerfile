# Use the Debian Image
# FROM debian:buster-slim
FROM alpine
MAINTAINER "Emmet O'Donoghue"

# Set Environment variables
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

# Install required apps from aptitude [ TODO - do we need all of these?]
RUN apt-get update --fix-missing && \
    apt-get install -y \
    bzip2 \
    ca-certificates \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    wget && \
    apt-get clean

# Download miniconda's latest version and install it
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy && \
    /opt/conda/bin/conda update conda -n base --y && \
    /opt/conda/bin/conda install conda-build -n base --y 

# @TODO - Unraid specific exports / paths/ envs?
CMD [ "/bin/bash" ]
