FROM antonio24073/aapanel:ubuntu-24-04

USER root

# ini SO updates, installs
RUN apt-get clean -y
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y

RUN bt 16

EXPOSE 7800 21 22 443 80 888
