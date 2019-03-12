@echo off

REM LogGenerator

SET VERSION=1.0.0-SNAPSHOT

cd ../../apps/LogGenerator/
call mvn -V clean install

REM Cd to root of Elasticfantastic

cd ../../

REM Copy compiled binaries from compile directory to root

echo\
xcopy "apps\LogGenerator\loggenerator-server\target\loggenerator-server-%VERSION%.jar" "." /Y
xcopy "apps\LogGenerator\loggenerator-client\target\loggenerator-client-%VERSION%.jar" "." /Y

REM Cd back to scripts
cd resources/scripts

timeout 5