FROM ubuntu:latest
LABEL maintainer="Lu Rui <jinli09051005@163.com>"
RUN apt update
RUN apt install wget curl telnet git -y
RUN wget -O yq https://github.com/mikefarah/yq/releases/download/v4.44.2/yq_linux_amd64 && chmod +x yq && mv yq /usr/bin
