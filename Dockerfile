#Specify a base image
#FROM node:alpine

#Specify a working directory
#WORKDIR /usr/app

#Copy the dependencies file
#COPY ./package.json ./

#Install dependencies
#RUN npm install 

#Copy remaining files
#COPY ./ ./

#Default command

#CMD ["node", "index.js"]


FROM jenkins/jenkins:lts



USER root

#install docker
RUN curl -sSL https://get.docker.com/ | sh

#install sudo
RUN apt-get update \
      && apt-get install -y sudo \
      && rm -rf /var/lib/apt/lists/*

#Adding jenkins to sudoers list and making an alias for sudo docker
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers \
      && printf '#!/bin/bash\nsudo /usr/bin/docker "$@"' > /usr/local/bin/docker \
      && chmod +x /usr/local/bin/docker

USER jenkins
