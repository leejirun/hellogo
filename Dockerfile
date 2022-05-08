FROM golang:alpine AS builder
LABEL AUTHOR jy Lee (wldus9503@gmail.com)

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

COPY go.mod hello.go ./

RUN go mod download

RUN go build -o hello .

WORKDIR /dist

RUN cp /build/hello .

FROM scratch

COPY --from=builder /dist/hello .

ENTRYPOINT ["/hello"]

# WORKDIR /Users/jylee/go/src/hellogo
# COPY . /Users/jylee/go/src/hellogo
# RUN go build -o hello.go

# CMD ["go run","hello.go"]

# ENTRYPOINT ["/Users/jylee/go/src/hello.go"]