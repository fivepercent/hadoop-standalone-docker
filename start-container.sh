#!/bin/bash

# start hadoop standalone container
sudo docker rm -f hadoop-standalone &> /dev/null
echo "start hadoop-standalone container..."

# volume dir
mkdir ~/src/
sudo chmod -R 777 ~/src

sudo docker run -itd \
		-v ~/src:/root/src \
				--name hadoop-standalone \
                zhuzhenle/hadoop-standalone &> /dev/null

# get into hadoop-hbase container
sudo docker exec -it hadoop-standalone bash
