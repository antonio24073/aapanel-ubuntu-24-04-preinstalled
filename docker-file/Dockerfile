FROM antonio24073/aapanel:ubuntu-24-04-preinstalled

USER root

# ini SO updates, installs
RUN apt-get clean -y
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y

RUN bt 16

COPY ./provision /provision
RUN ["chmod", "+x", "-R", "/provision/entrypoint"]
COPY ./provision/wp-cli.phar /usr/bin/wp
RUN ["chmod", "+x", "-R", "/provision/wp-cli.phar"]
RUN ["chmod", "+x", "-R", "/usr/bin/wp"]

ENTRYPOINT ["/bin/sh", "/provision/entrypoint/dev.sh"]

EXPOSE 7800 21 22 443 80 888
