FROM jenkins/jenkins:lts

USER root

RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb

RUN apt-get update
RUN apt-get install -y maven
RUN apt-get install -y openjdk-8-jdk
RUN apt-get install -y docker
RUN groupadd docker
RUN usermod -a -G docker jenkins

RUN apt-get install -y apt-transport-https
RUN apt-get install -y dotnet-sdk-3.1

USER jenkins

COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt
