#!/bin/bash

. ~/.bash_profile

cd /tmp

DATE=`date +"%Y%m%d%I%M%S"`
DUMP_FILE="kindle.dump"
S3_FILE=${DUMP_FILE}${DATE}

/usr/bin/docker exec -t mysql mysqldump -u root kindle > ${S3_FILE}

printenv

/usr/bin/gzip ${S3_FILE}

s3cmd put ${S3_FILE}.gz s3://gomesuit/mysql_backup/

rm -f ${S3_FILE}.gz

