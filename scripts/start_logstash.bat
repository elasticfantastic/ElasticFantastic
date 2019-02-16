@echo off

cd ../

REM Logstash

SET /P config_name="Enter the name of the configuration file: "

@echo off
REM If user doesn't enter anything, assume default logstash configuration file
IF "%config_name%" == "" (
	SET config_name=logstash.conf
)

cd logstash-6.6.0\bin\
start logstash.bat -f ../config/%config_name%