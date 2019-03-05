@echo off

cd ../../

REM Logstash

SET config_name=logstash.conf

cd logstash-6.6.0\bin\
call logstash.bat -f ../config/%config_name%

SET /P dummy="Hit ENTER to exit..."