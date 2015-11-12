FROM smebberson/alpine-nginx

RUN apk update && apk add curl git mercurial bzr go && rm -rf /var/cache/apk/*

ENV S6_BEHAVIOUR_IF_STAGE2_FAILS 2
ENV GOROOT /usr/lib/go
ENV GOPATH /gopath
ENV GOBIN /gopath/bin
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

RUN go get github.com/buger/gor

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx.conf /etc/nginx/
COPY services.d /etc/services.d
COPY cont-init.d /etc/cont-init.d