# Environment free runner for autoreconf

FROM alpine:3.15

RUN apk add --no-cache alpine-sdk autoconf libtool automake

WORKDIR /src

CMD ./autogen.sh
