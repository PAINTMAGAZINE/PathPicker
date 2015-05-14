#!/bin/bash
VERSION="0.5.6"
DEST="./dist/fpp.$VERSION.tar.gz"
mkdir -p ./dist/
tar -cf $DEST src/*.py fpp

sed -i '' -e "s#url .*#url \"https://github.com/facebook/PathPicker/releases/download/$VERSION/fpp.$VERSION.tar.gz\"#g" ./fpp.rb
HASH=$(cat $DEST | shasum -a 256 | cut -d " " -f 1)
sed -i '' -e "s#^  sha256 .*#  sha256 \"$HASH\"#g" ./fpp.rb

echo "Recipe updated with hash from $DEST"
