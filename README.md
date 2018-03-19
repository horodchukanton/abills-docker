# abills-docker
ABillS Base Dockerfile. 
Based on debian and allows you only to run webinterface 

# Usage:
Provide existing ABillS DB credentials to ./config.pl
Run script to fetch and build latest available ABillS release image
  ./download_and_build.sh

# After build
Run with:
  docker run -rm -p 9443:9443 abills-base
