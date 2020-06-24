#!/bin/bash

NOW=$(date +"%m-%d-%Y")
EXPORT_NAME="backup_${NOW}.sql"

ROOT_PW=password

mysqldump -u root -p$ROOT_PW db table_name > $EXPORT_NAME

aws s3 cp $EXPORT_NAME s3://bucket_name/backups/$EXPORT_NAME --storage-class REDUCED_REDUNDANCY
