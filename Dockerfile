FROM ubuntu:16.04
MAINTAINER Ridwan Shariffdeen <ridwan@comp.nus.edu.sg>

RUN useradd -ms /bin/bash naruto
USER naruto
WORKDIR /home/naruto
RUN echo "naruto    ALL=(ALL:ALL)"

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y  --no-install-recommends --force-yes \
    bc    \
    bison   \
    curl    \
    dejagnu    \
    flex    \
    g++ \
    libcap-dev    \
    libncurses5-dev \
    make \
    python \
    python-pip \
    python-dev \
    subversion \
    sudo

RUN pip install \
    virtualenv


ADD s2e-env /s2e-env
RUN cd /s2e-env && virtualenv venv && . venv/bin/activate