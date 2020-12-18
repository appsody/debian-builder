## Development of Appsody as a standalone project has ended, but the core technologies of Appsody have been merged with odo to create odo 2.0! See our [blog post](https://appsody.dev/blogs/DevelopmentEnded) for more details!

# appsody-debian-builder
Creates a Docker image that performs the debian package build for appsody.

The Docker image performs a simple Debian build (`debuild`), specifically for appsody (it could be made more generic - but this works for now).

The Docker image can be called as shown in the `run-debian-builder.sh` script:
> docker run -it -v $PWD:/input \
> -v $PWD:/output \
> -e CMD_NAME=appsody -e VERSION=0.0.1 \
> -e CONTROLLER_BASE_URL=https://raw.githubusercontent.com/chilanti/mock-watcher/master \
> chilantim/debian-builder

It expects the `appsody` executable to be available in the current directory (mounted as `/input`), and produces the debian package in the same current directory (mounted as `/output`).
It also takes a few environment variables:
- `CMD_NAME` is the name of the executable
- `CONTROLLER_BASE_URL` is the root URL of the location where the controller is published. 
- `VERSION` is the V-R-M

# The Debian package
The Debian package can be installed by running `sudo apt install <debian package name>`.
It will put `appsody` and `appsody-controller` into `/usr/bin`.
The package can be removed by running `sudo apt remove appsody`.

# To do's
- Some of the names (appsody, appsody-controller) are still hardcoded. We may leave them hardcoded, or make the `debian-build.sh` script smarter.
- Need to modify the `changelog`. This file (or it contents) should be maintained somewhere and injected into the Docker container at runtime (right now it's fixed).
- Need to refine the `copyright`.
