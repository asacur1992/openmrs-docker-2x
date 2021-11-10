#!/bin/sh

date=$(date +%d%m%Y_%Hh%Mm%Ss)
path=/home/user/Desktop/Backups_OpenMRS
filename=CS_Nome_$date.sql
zip_filename=$filename.zip

echo Starting Local backup

# Ensure directory exists
if [ ! -d "$path" ]; then
  mkdir -p "$path";
fi

echo Stop tomcat
docker stop refapp-tomcat

echo executing backup
# Create backup
docker exec -i refapp-db mysqldump -uroot --password=HIsf0rICAP openmrs > $path/$filename

# ZIP backup
cd $path
zip -9 $zip_filename $filename

# Remove uncompressed
rm $path/$filename

echo Completed Local backup

echo Stop mysql
docker stop refapp-db

echo restore the services
docker start refapp-db
docker start refapp-tomcat


echo Backup complete
