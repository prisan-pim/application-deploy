
docker login -u $1 -p $2 
docker build -t wenwen6046/app-no-ops:latest .
docker push wenwen6046/app-no-ops:latest