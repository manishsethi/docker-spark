#/bin/bash


# Installing the package required for using ppa
sudo apt-get install software-properties-common python-software-properties -y

#installing java7 if not installed
sudo apt-add-repository ppa:webupd8team/java -y
sudo apt-get update -y
sudo apt-get install oracle-java7-installer -y

#installing scala

wget http://www.scala-lang.org/files/archive/scala-2.10.4.tgz
sudo mkdir /usr/local/src/scala
sudo tar xvf scala-2.10.4.tgz -C /usr/local/src/scala/

#Setting scala environment variables
echo "export SCALA_HOME=/usr/local/src/scala/scala-2.10.4" >> ~/.bashrc
echo "PATH=$SCALA_HOME/bin:$PATH" >> ~/.bashrc

source ~/.bashrc


#Installing git to download spark 

apt-get install git -y 

#Downloading pre-build spark distribution
wget http://d3kbcqa49mib13.cloudfront.net/spark-1.2.0-bin-hadoop2.4.tgz
tar -xzvf spark-1.2.0-bin-hadoop2.4.tgz

#Running service up
mv spark-1.2.0-bin-hadoop2.4/ /usr/local/
mv /usr/local/spark-1.2.0-bin-hadoop2.4/ /usr/local/spark
echo "export SPARK_HOME=/user/local/spark" >> ~/.profile
echo "export PATH=$SPARK_HOME/bin:$PATH" >> ~/.profile
source ~/.profile

# Running Service up
./$SPARK_HOME/sbin/start-master.sh &

echo "spark is installed. Now you can test it out"
