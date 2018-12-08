GO_CMD=GO111MODULE=on go
GO_BUILD=$(GO_CMD) build
GO_CLEAN=$(GO_CMD) clean
GO_TEST=$(GO_CMD) test
GO_GET=$(GO_CMD) get
GO_FORMAT=$(GO_CMD) fmt
GO_IMPORTS=goimports

test: deps
	$(GO_GET) "github.com/stretchr/testify"
	$(GO_TEST) -v ./...

fmt:
	$(GO_GET) "golang.org/x/tools/cmd/goimports"
	find . -type f -name '*.go' -not -path "./**/*-packr.go" | xargs $(GO_IMPORTS)  -d -e -w

deps:
	$(GO_GET) -v -d ./...

update:
	$(GO_GET) -v -d -u ./...

