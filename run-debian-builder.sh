docker run -it -v $PWD:/input \
-v $PWD:/output \
-e CMD_NAME=appsody -e VERSION=0.0.1 \
-e CONTROLLER_BASE_URL=https://raw.githubusercontent.com/chilanti/mock-watcher/master \
chilantim/debian-builder

docker container rm debian-builder