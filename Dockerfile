#
##########################################################
# Dockerfile to build Apache Spark container images
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu:14.04
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# File Author / Maintainer
MAINTAINER Manish Sethi

# Update the repository sources list
RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes software-properties-common python-software-properties
RUN apt-add-repository ppa:webupd8team/java -y
RUN apt-get update -y
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
RUN DEBIAN_FRONTEND=noninteractive apt-get install oracle-java7-installer -y

################## BEGIN INSTALLATION ######################

# Installing scala
RUN wget http://www.scala-lang.org/files/archive/scala-2.10.4.tgz
RUN mkdir /usr/local/src/scala
RUN tar xvf scala-2.10.4.tgz -C /usr/local/src/scala/

#Setting scala environment variables
RUN echo "export SCALA_HOME=/usr/local/src/scala/scala-2.10.4" >> ~/.bashrc
RUN  echo "PATH=$SCALA_HOME/bin:$PATH" >> ~/.bashrc

RUN source ~/.bashrc

# Installing git to download spark 
RUN apt-get install git -y 
#RUN apt-get install apache2 -y 
# Downloading pre-build spark distribution

RUN wget http://d3kbcqa49mib13.cloudfront.net/spark-1.2.0-bin-hadoop2.4.tgz
RUN tar -xzvf spark-1.2.0-bin-hadoop2.4.tgz

# Running service up
RUN mv spark-1.2.0-bin-hadoop2.4/ /usr/local/
RUN mv /usr/local/spark-1.2.0-bin-hadoop2.4/ /usr/local/spark
RUN sudo chmod 775 -R /usr/local/spark



##################### INSTALLATION END #####################

# Exposing the port for outside access
EXPOSE 4040
