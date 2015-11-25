FROM java:8-jdk
MAINTAINER Liviu

# Gradle
ENV GRADLE_VERSION 2.9

WORKDIR /usr/lib

RUN wget https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip "gradle-${GRADLE_VERSION}-bin.zip" && \
    ln -s "/usr/lib/gradle-${GRADLE_VERSION}/bin/gradle" /usr/bin/gradle && \
    rm "gradle-${GRADLE_VERSION}-bin.zip"

# Set Appropriate Environmental Variables
ENV GRADLE_HOME /usr/src/gradle
ENV PATH $PATH:$GRADLE_HOME/bin

RUN mkdir -p /usr/bin/app
WORKDIR /usr/bin/app

RUN echo $HOME

ONBUILD echo I hope you mounted the folder with your gradle scripts to /usr/bin/app

