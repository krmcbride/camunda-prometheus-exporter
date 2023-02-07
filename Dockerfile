###
FROM golang:1.19
WORKDIR /go/src/krmcbride/camunda-prometheus-exporter
COPY Makefile go.mod go.sum ./
RUN make init
COPY main.go .
RUN make build

###
FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /go/src/krmcbride/camunda-prometheus-exporter/camunda-prometheus-exporter /root/camunda-prometheus-exporter
ENTRYPOINT ["/root/camunda-prometheus-exporter"]
