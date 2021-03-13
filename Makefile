all: run build

build:
	docker build -t dev-container .

run:
	docker run -it dev-container bash
