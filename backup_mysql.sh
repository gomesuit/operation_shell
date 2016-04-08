#!/bin/bash

cd /tmp

DATE=`date +"%Y%m%d%I%M%S"`
DUMP_FILE="kindle.dump"
S3_FILE=${DUMP_FILE}${DATE}

/usr/bin/docker exec -t mysql mysqldump -u root kindle > ${S3_FILE}

printenv

/usr/bin/gzip ${S3_FILE}

/usr/bin/docker run --rm -v $(pwd):/s3 gomesuit/s3cmd put ${S3_FILE}.gz s3://gomesuit/mysql_backup/${S3_FILE}.gz

rm -f ${S3_FILE}.gz

