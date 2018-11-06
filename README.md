# abills-docker
ABillS Base Dockerfile. 
Based on debian. Allows to run webinterface.

**Needs external configured DB to run**

# Usage:
Provide existing ABillS DB credentials to ./config.pl

Run script to fetch and build latest available ABillS Base release image

  ./download_and_build.sh

# After build :
Run with:

  docker run --rm -p 9443:9443 abills-base
  
# Running on existing abills folder
If you have prebuilt image you can specify it as a docker volume:
  docker run --rm -p 9443:9443 -v /usr/abills:/usr/abills abills-base
