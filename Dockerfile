FROM golang:1.22.5-alpine3.20
WORKDIR /app
COPY . /app
RUN go build -o app .
EXPOSE 8000
ENTRYPOINT [ "./app" ]