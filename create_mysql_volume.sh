#/bin/bash

docker create --name mysqlvolume -v /data/mysql:/var/lib/mysql busybox

