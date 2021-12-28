# go-fdkaac

Golang binding for lib-fdkaac(https://github.com/mstorsjo/fdk-aac)

Only decoders available.

## Usage
```
$ git submodule add https://github.com/IzumiSy/go-fdkaac.git lib/go-fdkaac
$ git submodule update --init --recursive
$ cd lib/go-fdkaac
$ ./build.sh
```

## Tests
```
$ GO111MODULE=off go test ./...
```
