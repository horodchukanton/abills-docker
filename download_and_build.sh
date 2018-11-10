#!/bin/bash

VERSION="0.78"
PREFIX=".30"

[ -d usr ] || mkdir usr
cd usr

[ -d abills ] && rm -rf abills

wget -O abills.tar.gz "https://netix.dl.sourceforge.net/project/abills/abills/$VERSION/abills-$VERSION$PREFIX.tgz";

[ -f abills.tar.gz ] || exit 1;

tar -zxvf abills.tar.gz
rm -f abills.tar.gz

cd ..

docker build . -t "abills-base:$VERSION$PREFIX"

