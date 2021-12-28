OBJS_PATH := $(shell pwd)/fdkaac-objs
CFLAGS := -I$(OBJS_PATH)/include/fdk-aac
LDFLAGS := $(OBJS_PATH)/lib/libfdk-aac.a -lm

.PHONY: build
build:
	docker build -t fdkaac .

.PHONY: test/setup
test/setup: $(OBJS_PATH)/lib/libfdk-aac.a
	docker run -v $(OBJS_PATH):/fdkaac/fdkaac-objs fdkaac

.PHONY: test
test:
	GO111MODULE=on CGO_CFLAGS="$(CFLAGS)" CGO_LDFLAGS="$(LDFLAGS)" go test -count=1 ./...
