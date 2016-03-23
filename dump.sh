#/bin/bash
DUMP_FILE="kindle.dump"`date +"%Y%m%d%I%M%S"`
mysqldump -u root kindle > ${DUMP_FILE}
