#!/bin/bash

DB_HOST=$1
DB_USER=$2
DB_PASSWD=$3
DB_DB=$4
DB_DUMP_TIMESTAMP="DB_$(date +"%d-%m-%Y__%H:%M").sql";


export AWS_ACCESS_KEY_ID=AKIAZRVJ5YU524ZRKJWM
export AWS_SECRET_ACCESS_KEY=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

# MAKE A VALIDATION CHECK TO SEE IF ALL ARGUMENTS ARE SET
if [ ${#@} != 4 ]; then
  echo "arguments are missing. you need to input \
host, user, passwd, dbname in-order"
elif [[ -v DB_HOST && -v DB_USER && -v DB_PASSWD && -v DB_DB ]]; then

  echo "all the arguments are set $DB_DB, $DB_USER, $DB_HOST, $DB_PASSWD";
  mysqldump -h $DB_HOST -u $DB_USER -p$DB_PASSWD $DB_DB > /tmp/$DB_DUMP_TIMESTAMP

  echo 'mysql dump successful! whooo !! ';

  echo 'dumping the local db-dump to aws S3 now........'

  aws s3 cp /tmp/$DB_DUMP_TIMESTAMP s3://practise-jenkins-mysql-bucket/$DB_DUMP_TIMESTAMP;
  echo 'The LOCAL DB BACKUP IS SUCCESSFULLY PUSED TO AWS S3 BUCKET';

else
  echo "some args are missing plz enter them as well!";
fi;