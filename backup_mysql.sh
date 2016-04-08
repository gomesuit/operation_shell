#!/bin/bash

cd /tmp

DATE=`date +"%Y%m%d%I%M%S"`
DUMP_FILE="kindle.dump"
S3_FILE=${DUMP_FILE}${DATE}

docker exec -it mysql mysqldump -u root kindle > ${S3_FILE}

gzip ${S3_FILE}

docker run --rm -v $(pwd):/s3 gomesuit/s3cmd put ${S3_FILE}.gz s3://gomesuit/mysql_backup/${S3_FILE}.gz

rm ${S3_FILE}.gz

