@echo off

REM LogGenerator

SET VERSION=1.0.0-SNAPSHOT

REM Cd to root of Elasticfantastic

cd ../../

echo Don't close this window; it will close itself when the startup process is completed.
echo\
echo Starting integration...

start cmd /k "java -jar loggenerator-server-%VERSION%.jar Server1 resources/logs/log_server1.txt"
echo - Server1 started [1/2]

timeout /t 15 /nobreak > NUL

start cmd /k "java -jar loggenerator-client-%VERSION%.jar Client1 resources/logs/log_client1.txt"
echo - Client1 started [2/2]