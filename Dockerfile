FROM golang:alpine AS builder

RUN apk update && apk add --no-cache git && apk add bash

WORKDIR $GOPATH/src/example/hello

COPY /hello/. .

RUN  go build -o /go/bin/

FROM scratch

COPY --from=builder /go/bin/hello /go/bin/hello

ENTRYPOINT [ "/go/bin/hello" ]