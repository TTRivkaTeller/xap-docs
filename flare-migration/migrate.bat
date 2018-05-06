@echo off
if not exist site-temp (
   echo Duplicating site-temp...
   mkdir site-temp
   xcopy /E ..\site site-temp
)

echo Overriding site-temp...
xcopy /Y /E site-overrides site-temp

echo Building navbar...
call mvn --file jarvis package -DskipTests
call java -jar jarvis/target/jarvis-1.0.jar %~dp0 site-temp
call java -jar jarvis/target/jarvis-1.0.jar analyze-shortcodes site-temp\content\xap\12.3 shortcodes-usage.csv

echo Starting Hugo...
pushd site-temp
hugo -d ..\output
popd
pause