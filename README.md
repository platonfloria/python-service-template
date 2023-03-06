# {{ service-name }}

## Build image

```bash
./build.sh
```

## Test image

```bash
./test.sh
```

## Run command inside the container

```bash
./terminal.sh
```

## Run stack

```bash
./run.sh
```

## Configuration

Create custom.cfg file. It can be used to store and inject secrets, that should not be commited into the repo.
Additional local only docker options can be specified in `custom_options` variable, such as volume mounts, i.e.

```
custom_options="""
  --volume=`pwd`/../some-package-repo/some_package:/usr/local/lib/python3.7/site-packages/some_package
"""
```
