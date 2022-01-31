

build:
	docker build -t cheatsheet .

run:
	docker run -it -p 8080:8080 cheatsheet markserv -p 8080 -a 0.0.0.0