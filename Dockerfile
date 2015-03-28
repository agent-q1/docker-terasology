FROM ubuntu:14.04
MAINTAINER Marcel Otte <qwc+docker@mmo.to>
RUN apt-get update && apt-get install -y openjdk-7-jre-headless
RUN apt-get install -y wget unzip
RUN mkdir /terasology
#RUN wget -P /terasology http://jenkins.terasology.org/job/TerasologyStable/lastSuccessfulBuild/artifact/build/distributions/Terasology.zip
RUN wget -P /terasology https://github.com/MovingBlocks/Terasology/releases/download/stable50/TerasologyOmega.zip
RUN unzip /terasology/TerasologyOmega.zip -d /terasology
ENTRYPOINT java -jar /terasology/libs/Terasology.jar -headless -homedir=/terasology/server
VOLUME /terasology/server
EXPOSE 25777
