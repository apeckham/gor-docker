FROM kiasaki/alpine-golang

RUN go get github.com/buger/gor

ENTRYPOINT ["/gopath/bin/gor"]