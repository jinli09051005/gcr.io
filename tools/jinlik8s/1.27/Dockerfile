FROM registry.cn-hangzhou.aliyuncs.com/jinli09051005/tools:busybox-latest
LABEL maintainer="Lu Rui <jinli09051005@163.com>"
WORKDIR /app
COPY pkg ./pkg
COPY bin ./bin
COPY hack ./hack
# apiserver-boot
RUN wget https://github.com/kubernetes-sigs/apiserver-builder-alpha/releases/download/v1.23.0/apiserver-boot-linux-amd64.tar.gz && tar -xvf  apiserver-boot-linux-amd64.tar.gz && rm -rf apiserver-boot-linux-amd64.tar.gz
# golang
RUN wget -O pkg/go.tar.gz https://golang.google.cn/dl/go1.21.12.linux-amd64.tar.gz --no-check-certificate
# operator-sdk
RUN wget https://github.com/operator-framework/operator-sdk/releases/download/v1.27.0/operator-sdk_linux_amd64 --no-check-certificate && chmod +x operator-sdk_linux_amd64 && mv operator-sdk_linux_amd64 bin/operator-sdk
# kubernetes-1.27
RUN git clone -b release-1.27 https://github.com/kubernetes/kubernetes.git ./pkg/kubernetes/
