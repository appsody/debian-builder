set -e
docker build -t appsody/debian-builder .
docker push appsody/debian-builder