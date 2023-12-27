#!/bin/bash

file="$1"
filename=$(basename $file .s)

gcc -c "$filename".s && ld "$filename".o -o "$filename".out && ./"$filename".out
