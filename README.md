# hadoop-standalone-docker
Hadoop ecosystem in non-distributed mode. This is useful for debugging.
# Configurature
Hadoop Version: Apache Hadoop 2.8.0
OS: ubuntu 16.04
java: java-8-openjdk
# Usage
* Clone git repository
```
git clone https://github.com/fivepercent/hadoop-standalone-docker
```
* Pull from docker hub
```
docker pull zhuzhenle/hadoop-standalone
```
* Build image from dockerfile
```
cd hadoop-standalone/
./build-image.sh
```
* Run container
```
./start-container.sh
```
