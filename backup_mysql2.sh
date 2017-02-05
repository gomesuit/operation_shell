#!/bin/bash
set -e

cd /tmp

DATE=`date +"%Y%m%d%I%M%S"`
DUMP_FILE="kindle.dump"
S3_FILE=${DUMP_FILE}${DATE}

mysqldump -h 127.0.0.1 -u kindle -ppassword kindle > ${S3_FILE}

/usr/bin/gzip ${S3_FILE}

s3cmd put ${S3_FILE}.gz s3://gomesuit/mysql_backup/

rm -f ${S3_FILE}.gz

