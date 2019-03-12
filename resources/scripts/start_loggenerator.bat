@echo off

REM LogGenerator

SET VERSION=1.0.0-SNAPSHOT

REM Cd to root of Elasticfantastic

cd ../../

REM if not exist apps\LogGenerator_system mkdir apps\LogGenerator_system

xcopy "apps\LogGenerator\loggenerator-server\target\loggenerator-server-%VERSION%.jar" "." /Y
xcopy "apps\LogGenerator\loggenerator-client\target\loggenerator-client-%VERSION%.jar" "." /Y

REM cd apps/LogGenerator_system

start cmd /k "java -jar loggenerator-server-%VERSION%.jar Server1 resources/logs/log_server1.txt"
timeout /t 15 /nobreak > NUL
start cmd /k "java -jar loggenerator-client-%VERSION%.jar Client1 resources/logs/log_client1.txt"

REM cd ../../scripts