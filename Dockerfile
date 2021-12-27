# Environment free runner for autoreconf

FROM alpine:3.15 as build

RUN apk add --no-cache autoconf libtool automake

WORKDIR /fdkaac-lib
COPY /fdkaac-lib /fdkaac-lib

RUN ./autogen.sh

FROM scratch as artifact
COPY --from=build /fdkaac-lib /fdkaac-lib
