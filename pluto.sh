#!/bin/bash
DATA=`date`
MEMORY=`free -m | awk '/Mem/{printf "%s",$4}'`
echo "Data: $DATA, wolna pamiec MB: $MEMORY" > info.log
