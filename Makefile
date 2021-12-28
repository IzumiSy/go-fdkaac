PWD := $(shell pwd)
OBJS := $(PWD)/fdkaac-objs
CFLAGS := -I$(OBJS)/include/fdk-aac
LDFLAGS := $(OBJS)/lib/libfdk-aac.a -lm

.PHONY: build
build:
	docker build -t autogen-runner .
	docker run --rm -v $(PWD)/fdkaac-lib:/src autogen-runner
	cd fdkaac-lib \
		&& ./configure --prefix="$(OBJS)" \
		&& make \
		&& make install

.PHONY: test
test: build
	GO111MODULE=on CGO_CFLAGS="$(CFLAGS)" CGO_LDFLAGS="$(LDFLAGS)" go test -count=1 ./...
