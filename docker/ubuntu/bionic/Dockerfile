FROM ubuntu:18.04
MAINTAINER "Blair Davidson <blair.joel.davidson@gmail.com>"

# ensure the users account is created inside the container for permissions and X11 etc
ARG username
ARG uid
ARG passwd
# Update and add in additional repositories for packages
RUN apt update && \
    apt-get --yes upgrade && \
    apt-get --yes install build-essential software-properties-common && \
    add-apt-repository universe && \
    add-apt-repository multiverse && \
    apt update && \
    apt-get --yes upgrade
# tzdata prompts so just ignore you can set this up later in your terminal
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
# install standard C / C++ development tools and build tools
# ensure git is abailable to pull down additional libraries etc
RUN apt-get --yes install \
        cmake \
        gcc-6 \
        g++-6 \
        gcc-7 \
        g++-7 \
        git \
        autoconf \
        sudo \
        bison \
        wget \
        flex \
        automake \
        autotools-dev \
        net-tools \
        gawk \
        libxi6 \
        libxrender1 \
        expect \
        htop \
        valgrind \
        libxtst6 \
        vim && \
# ensure we have options configured for gcc
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 100 --slave /usr/bin/g++ g++ /usr/bin/g++-7 && \
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 70 --slave /usr/bin/g++ g++ /usr/bin/g++-6 && \
# fetch wget CLion and extract
    wget -q https://download.jetbrains.com/cpp/CLion-2018.3.tar.gz && \
    tar -xvzf CLion-2018.3.tar.gz  && \
    mv clion-2018.3 /opt/clion && \
    chmod a+x /opt/clion/bin/clion.sh && \
# add user account and ensure user is part of the sudo group
    useradd -m -u ${uid} -U -s /bin/bash -p ${passwd} ${username} && \
    usermod -aG sudo ${username} && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
WORKDIR /opt/clion/bin
CMD ./clion.sh