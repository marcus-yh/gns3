FROM ubuntu:latest

# define additional apt repositories
ENV APT_REPOS \
    ppa:gns3/ppa

# define apt dependencies
ENV APT_DEPS \
    gns3-server \
    gns3-gui

# update the package list and install software-properties-common
# so that add-apt-repositories command can be used later
RUN apt-get update && \
    apt-get install -y software-properties-common

# add repository, update the package list and install dependencies
RUN add-apt-repository ${APT_REPOS} && \
    apt-get update && \
    apt-get install -y ${APT_DEPS}

# expose gns3 ports
EXPOSE 3080 3080/udp 22

# start gns3 server
CMD ["gns3server"]