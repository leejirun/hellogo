FROM golang:1.18-alpine

WORKDIR /app

COPY go.mod .
RUN go mod download
COPY *.go ./
RUN go build -o /hellogo
EXPOSE 8080
CMD [ "/hellogo" ]