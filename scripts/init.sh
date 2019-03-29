#!/bin/bash

CONFIG=$(<$1)
YAJTA="/home/nharrand/Documents/yajta/script/tie.sh /home/nharrand/Documents/yajta/target/yajta-2.0.0-jar-with-dependencies.jar"


for o in $(echo $CONFIG | jq -c '.[]')
do
	URL=$(echo $o | jq -r '.url')
	REPO=$(echo $o | jq -r '.repo')
	PACKAGES=$(echo $o | jq -r '.packages')
	COMMIT=$(echo $o | jq -r '.commit')
	
	git clone $URL
	cd $REPO
	git reset --hard $COMMIT
	mvn install
	TORUN=$(echo "$YAJTA $PACKAGES")
	eval $TORUN
	cd ..
done