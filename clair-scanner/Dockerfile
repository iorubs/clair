FROM alpine:3.8

RUN apk update \
    && apk add curl

WORKDIR /scanner

RUN curl -sL https://github.com/arminc/clair-scanner/releases/download/v8/clair-scanner_linux_amd64 -o /usr/local/bin/clair-scanner \
    && chmod +x /usr/local/bin/clair-scanner

COPY entrypoint.sh .
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
