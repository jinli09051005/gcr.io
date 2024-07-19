FROM ubuntu:latest
LABEL maintainer="Lu Rui <jinli09051005@163.com>"
WORKDIR /app
COPY code-generator /app/code-generator
COPY genswaggertypedocs /app 
RUN apt update
RUN apt install wget curl telnet git -y
RUN git clone -b release-1.27 https://github.com/kubernetes/kubernetes.git

