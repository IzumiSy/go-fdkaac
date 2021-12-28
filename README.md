# go-fdkaac
Golang binding for lib-fdkaac(https://github.com/mstorsjo/fdk-aac)

Only decoders available.

## Setup (install fdkaac loaclly)
Docker is required.
```bash
$ git clone https://github.com/IzumiSy/go-fdkaac.git
$ docker build -t fdkaac .
$ docker run --rm -v $YOUR_OWN_INSTALLATION_PATH:/fdkaac/fdkaac-objs fdkaac
```

## Usage
```bash
# Download go-fdkaac package
$ go get github.com/IzumiSy/go-fdkaac

# Add import of go-fdkaac in your app (import "github.com/IzumiSy/go-fdkaac")
$ vim yourapp.go

# Set flags for cgo (this is required to build your app with go-fdkaac)
$ export CFLAGS="-I$YOUR_OWN_INSTALLATION_PATH/include/fdk-aac"
$ export LDFLAGS="$YOUR_OWN_INSTALLATION_PATH/lib/fdk-aac.a -lm"

# Build your app
$ go build yourapp.go
```

## Tests
```bash
$ make test
```
