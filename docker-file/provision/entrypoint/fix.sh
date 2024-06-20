#!/bin/sh

cp /www/server/panel/data/default.db /www/server/panel/data/default.db_bak
cd /www/backup/panel/
unzip 2023-08-17.zip
cp 2023-08-17/data/default.db /www/server/panel/data/default.db
bt restart