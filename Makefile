.PHONY: make-image

make-image:
	docker build -t yfr/rtmpserver:latest .

run:
	docker run -it yfr/rtmpserver:latest
