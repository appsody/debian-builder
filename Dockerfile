FROM ubuntu

RUN apt-get update && \
      apt-get -y install sudo

RUN apt-get install -y wget devscripts build-essential lintian debhelper

#RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo

#USER docker
RUN mkdir /debuild
COPY debian_build.sh /debuild
#COPY appsody-deb.tar /debuild
RUN cd /debuild && chmod 755 debian_build.sh
CMD /debuild/debian_build.sh
