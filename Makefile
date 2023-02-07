
.PHONY: init
init:
	go mod download

.PHONY: build
build:
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo .

.PHONY: clean
clean:
	go clean