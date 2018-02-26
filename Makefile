default: build-50

HTTP_HOST_PORT ?= 8080
VNC_HOST_PORT ?= 5900
MODE ?= exec
VOLUME ?= none
LAUNCH_MODE ?= non-gui

ifeq ($(VOLUME), none)
VOLUME_COMMAND=
else
VOLUME_COMMAND = -v $(VOLUME):/root/data
endif


# Pharo 5.0
build-50:
	cd src && docker build -f Dockerfile-50 -t pharo-50 .

run-50: build-50 stop-50
ifeq ($(MODE), connect)
	docker run $(VOLUME_COMMAND) -p $(HTTP_HOST_PORT):9000 -p $(VNC_HOST_PORT):5900 -e MODE=$(LAUNCH_MODE) --name pharo-50 -it pharo-50 bash
else
	docker run $(VOLUME_COMMAND) -p $(HTTP_HOST_PORT):9000 -p $(VNC_HOST_PORT):5900 -e MODE=$(LAUNCH_MODE) --name pharo-50 -it pharo-50
endif

stop-50:
	docker rm -f pharo-50 || true


# Pharo 6.1
build-61:
	cd src && docker build -f Dockerfile-61 -t pharo-61 .

run-61: build-61 stop-61
ifeq ($(MODE), connect)
	docker run $(VOLUME_COMMAND) -p $(HTTP_HOST_PORT):9000 -p $(VNC_HOST_PORT):5900 -e MODE=$(LAUNCH_MODE) --name pharo-61 -it pharo-61 bash
else
	docker run $(VOLUME_COMMAND) -p $(HTTP_HOST_PORT):9000 -p $(VNC_HOST_PORT):5900 -e MODE=$(LAUNCH_MODE) --name pharo-61 -it pharo-61
endif

stop-61:
	docker rm -f pharo-61 || true