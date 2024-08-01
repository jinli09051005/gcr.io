FROM registry.cn-hangzhou.aliyuncs.com/jinli09051005/tools:busybox-latest
LABEL maintainer="Lu Rui <jinli09051005@163.com>"
WORKDIR /app
COPY pkg ./pkg
COPY bin ./bin
RUN wget -O pkg/go.tar.gz https://golang.google.cn/dl/go1.21.12.linux-amd64.tar.gz --no-check-certificate
RUN git clone -b release-1.27 https://github.com/kubernetes/kubernetes.git ./pkg/kubernetes/
