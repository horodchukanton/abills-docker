# abills-docker
ABillS Base Dockerfile. \ 
Based on Ubuntu. Allows to run webinterface.\
Uses s6 supervisor to allow running several processes in a container.\

**Needs external configured DB to run**

# Usage:
Provide existing ABillS DB credentials to ./config.pl

Run script to fetch and build latest available ABillS Base release image

  ./download_and_build.sh

# After build :
Run with:

  docker run --rm -p 9443:9443 abills-base
  
# Running on existing ABillS folder
If you have prebuilt image you can specify existing ABillS folder as a docker volume:
  docker run --rm -p 9443:9443 -v /usr/abills:/usr/abills abills-base
