@echo off

SET index=log

REM Cd to root of Elasticfantastic
cd ../../

echo Deleting sincedb file...
del "resources\logs\sincedb\*sincedb*" /F /Q

echo\

REM Cd back to scripts/logs
cd scripts\logs

echo Emptying index content...
call lib/winhttpjs.bat http://192.168.99.100:9200/%index%/_delete_by_query -method POST -header elasticsearch_log_cleanup_headers.txt -body-file elasticsearch_log_cleanup_body.json

echo\

echo Log cleanup done!

timeout 5