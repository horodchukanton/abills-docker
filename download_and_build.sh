#!/bin/bash

VERSION="0.77"
PREFIX=".71_rc2"

mkdir usr
cd usr

[ -d abills ] && rm -rf abills

wget -O abills.tar.gz "https://netix.dl.sourceforge.net/project/abills/abills/$VERSION/abills-$VERSION$PREFIX.tgz";
tar -zxvf abills.tar.gz

rm -f abills.tar.gz

cd ..

docker build . -t "abills-base"

