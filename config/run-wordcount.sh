#!/bin/bash

# test the hadoop cluster by running wordcount

# create input files 
mkdir input
echo "Hello Docker" >input/file2.txt
echo "Hello Hadoop" >input/file1.txt

# run wordcount 
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/sources/hadoop-mapreduce-examples-2.8.0-sources.jar org.apache.hadoop.examples.WordCount input output

# print the output of wordcount
echo -e "\nwordcount output:"
cat output/*
