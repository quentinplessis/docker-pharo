# Docker Images for Pharo

# Pharo 5.0

## Simple
Launch default image

```
make run-50
```

Launch image stored in ./data

```
VOLUME=$PWD/data make run-50
```

Force stop

```
make stop-50
```

## With VNC enabled
Launch default image

```
make run-50-vnc
```

Launch image stored in ./data

```
VOLUME=$PWD/data make run-50-vnc
```

Specify VNC host port

```
VOLUME=$PWD/data VNC_HOST_PORT=3000 make run-50-vnc
```

Force stop

```
make stop-50-vnc
```