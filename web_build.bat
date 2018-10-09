@echo off




set gen_war=ca2ke-0.0.1-SNAPSHOT.war
set target_forRd="C:\Program Files\Apache Software Foundation\Tomcat 8.0\webapps\ca2ke"
set target_forDel="C:\Program Files\Apache Software Foundation\Tomcat 8.0\webapps\ca2ke.war"
set target_forCopy="C:\Program Files\Apache Software Foundation\Tomcat 8.0\webapps"


::::::::::::::::::::::::::::::::::::::::::



rd /s /q %target_forRd%
del %target_forDel%

start /wait cmd /c mvn clean package

cd target

ren %gen_war% ca2ke.war

copy ca2ke.war %target_forCopy%

cd ..\

"%CATALINA_HOME%\bin\startup.bat"



::::::::::::::::::::::::::::::::::::::::::

