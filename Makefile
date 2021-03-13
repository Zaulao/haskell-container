all: build run

build:
	docker build -t dev-container .

run:
	docker container rm dev-container
	docker run --name dev-container -v $(shell pwd)/code:/root/code -it dev-container bash