FROM alpine:3.15

RUN apk add --no-cache alpine-sdk autoconf libtool automake

COPY . /fdkaac
WORKDIR /fdkaac/fdkaac-lib

CMD ./autogen.sh && \
  ./configure --prefix=/fdkaac/fdkaac-objs && \
  make && \
  make install
