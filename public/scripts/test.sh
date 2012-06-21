#!/bin/bash
file=$1
while read line; do 
echo $line
sleep 1
done<$file
