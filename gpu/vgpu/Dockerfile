FROM registry.cn-hangzhou.aliyuncs.com/jinli09051005/tools:golang-1.21
WORKDIR /app
COPY . .
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.io,direct
RUN go get gorgonia.org/gorgonia
RUN go get gorgonia.org/tensor
