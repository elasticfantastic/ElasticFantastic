@echo off

SET index=orders

REM Cd to root of Elasticfantastic
cd ../../../

echo Deleting last_run file...
del "resources\orders\orders_last_run" /F /Q

echo\

REM Cd back to resources/scripts/orders
cd resources\scripts\orders

echo Emptying index content...
call lib/winhttpjs.bat http://localhost:9200/%index%/_delete_by_query -method POST -header elasticsearch_orders_cleanup_headers.txt -body-file elasticsearch_orders_cleanup_body.json

echo\

echo Orders cleanup done!

timeout 5 