FROM golang:alpine as build-env
ENV CGO_ENABLED=0
ENV GO111MODULE=on
WORKDIR $GOPATH/src/app-no-ops

COPY . .

RUN go mod download

RUN go build

FROM scratch

COPY --from=build-env /go/src/app-no-ops/test /go/src/app-no-ops/test

ENTRYPOINT ["/go/src/app-no-ops/test"]