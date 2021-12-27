# Environment free runner for autoreconf

FROM alpine:3.15 as configure

RUN apk add --no-cache autoconf libtool automake

WORKDIR /fdkaac-lib
COPY /fdkaac-lib /fdkaac-lib

RUN ./autogen.sh

FROM scratch as artifact
COPY --from=configure /fdkaac-lib /fdkaac-lib

FROM alpine:3.15 as build
COPY --from=artifact /fdkaac-lib /fdkaac-lib

RUN apk add --no-cache alpine-sdk

WORKDIR /fdkaac-lib
RUN ./configure --prefix=$(pwd)/fdkaac-objs
RUN make
RUN make install
