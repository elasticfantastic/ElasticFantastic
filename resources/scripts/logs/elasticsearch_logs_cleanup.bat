@echo off

SET index=logs

REM Cd to root of Elasticfantastic
cd ../../../

echo Deleting sincedb file...
del "resources\logs\sincedb\*sincedb*" /F /Q

echo\

REM Cd back to resources/scripts/logs
cd resources\scripts\logs

echo Emptying index content...
call lib/winhttpjs.bat http://localhost:9200/%index%/_delete_by_query -method POST -header elasticsearch_logs_cleanup_headers.txt -body-file elasticsearch_logs_cleanup_body.json

echo\

echo Log cleanup done!

timeout 5