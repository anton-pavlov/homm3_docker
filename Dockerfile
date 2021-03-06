FROM ubuntu:18.04

RUN apt update && apt install -y wget gnupg software-properties-common

RUN dpkg --add-architecture i386

RUN wget -nc https://dl.winehq.org/wine-builds/winehq.key && apt-key add winehq.key
RUN add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ xenial main' && \
    apt-add-repository "deb http://us.archive.ubuntu.com/ubuntu/ xenial main universe"
RUN apt-get update && apt-get install -y \
    winehq-stable \
	alsa-utils \
	libasound2 \
	libasound2-plugins \
	pulseaudio \
	pulseaudio-utils \
	libpng12-0

ENV DISPLAY :0