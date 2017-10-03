default: build-50

VNC_HOST_PORT ?= 5900
MODE ?= exec
VOLUME ?= none

ifeq ($(VOLUME), none)
VOLUME_COMMAND=
else
VOLUME_COMMAND = -v $(VOLUME):/root/data
endif

# Pharo 50
build-50:
	cd src && docker build -f Dockerfile-Pharo50 -t pharo-50 .

run-50: build-50 stop-50
ifeq ($(MODE), connect)
	docker run $(VOLUME_COMMAND) --name pharo-50 -it pharo-50 bash
else
	docker run $(VOLUME_COMMAND) --name pharo-50 -it pharo-50
endif

stop-50:
	docker rm -f pharo-50 || true

# Pharo 50 with VNC enabled
build-50-vnc:
	cd src && docker build -f Dockerfile-Pharo50-vnc -t pharo-50-vnc .

run-50-vnc: build-50-vnc stop-50-vnc
ifeq ($(MODE), connect)
	docker run $(VOLUME_COMMAND) -p $(VNC_HOST_PORT):5900 --name pharo-50-vnc -it pharo-50-vnc bash
else
	docker run $(VOLUME_COMMAND) -p $(VNC_HOST_PORT):5900 --name pharo-50-vnc pharo-50-vnc
endif

stop-50-vnc:
	docker rm -f pharo-50-vnc || true
