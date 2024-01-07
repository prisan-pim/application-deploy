docker login -u $1 -p $2 
docker buildx build --platform linux/amd64,linux/arm64 -t wenwen6046/app-no-ops:latest --push .