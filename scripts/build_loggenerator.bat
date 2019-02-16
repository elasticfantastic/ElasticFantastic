@echo off

REM LogGenerator

cd ../apps/LogGenerator/
mvn -V clean install

REM Cd back to scripts
cd ../../scripts