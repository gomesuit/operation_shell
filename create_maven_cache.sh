#/bin/bash


docker create --name mavencache -v /data/maven:/root/.m2 busybox
