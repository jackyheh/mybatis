@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  data_service startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Add default JVM options here. You can also use JAVA_OPTS and DATA_SERVICE_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto init

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto init

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:init
@rem Get command-line arguments, handling Windows variants

if not "%OS%" == "Windows_NT" goto win9xME_args

:win9xME_args
@rem Slurp the command line arguments.
set CMD_LINE_ARGS=
set _SKIP=2

:win9xME_args_slurp
if "x%~1" == "x" goto execute

set CMD_LINE_ARGS=%*

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\data_service.jar;%APP_HOME%\lib\lombok-1.16.12.jar;%APP_HOME%\lib\spring-core-4.2.5.RELEASE.jar;%APP_HOME%\lib\spring-context-support-4.2.5.RELEASE.jar;%APP_HOME%\lib\spring-beans-4.2.5.RELEASE.jar;%APP_HOME%\lib\spring-oxm-4.2.5.RELEASE.jar;%APP_HOME%\lib\spring-jms-4.2.5.RELEASE.jar;%APP_HOME%\lib\spring-retry-1.1.2.RELEASE.jar;%APP_HOME%\lib\spring-context-4.2.5.RELEASE.jar;%APP_HOME%\lib\spring-aop-4.2.5.RELEASE.jar;%APP_HOME%\lib\spring-tx-4.2.5.RELEASE.jar;%APP_HOME%\lib\spring-test-4.2.5.RELEASE.jar;%APP_HOME%\lib\spring-webmvc-4.2.5.RELEASE.jar;%APP_HOME%\lib\spring-jdbc-4.2.5.RELEASE.jar;%APP_HOME%\lib\jstl-1.2.jar;%APP_HOME%\lib\standard-1.1.2.jar;%APP_HOME%\lib\javax.servlet-api-3.1.0.jar;%APP_HOME%\lib\zkclient-0.8.1.jar;%APP_HOME%\lib\zookeeper-3.4.8.jar;%APP_HOME%\lib\disconf-client-2.6.36.jar;%APP_HOME%\lib\dubbo-2.8.5-SNAPSHOT.jar;%APP_HOME%\lib\java-gearman-service-0.7.0.jar;%APP_HOME%\lib\activemq-client-5.14.3.jar;%APP_HOME%\lib\activemq-pool-5.14.3.jar;%APP_HOME%\lib\activemq-spring-5.14.3.jar;%APP_HOME%\lib\commons-pool2-2.4.2.jar;%APP_HOME%\lib\quartz-2.2.3.jar;%APP_HOME%\lib\slf4j-api-1.7.21.jar;%APP_HOME%\lib\log4j-slf4j-impl-2.7.jar;%APP_HOME%\lib\log4j-core-2.7.jar;%APP_HOME%\lib\mybatis-3.4.2.jar;%APP_HOME%\lib\mapper-3.3.9.jar;%APP_HOME%\lib\mybatis-spring-1.3.1.jar;%APP_HOME%\lib\pagehelper-5.0.0.jar;%APP_HOME%\lib\jedis-2.9.0.jar;%APP_HOME%\lib\mysql-connector-java-5.1.35.jar;%APP_HOME%\lib\druid-1.0.12.jar;%APP_HOME%\lib\aspectjrt-1.8.7.jar;%APP_HOME%\lib\aspectjweaver-1.8.7.jar;%APP_HOME%\lib\javax.el-api-3.0.0.jar;%APP_HOME%\lib\javax.el-2.2.6.jar;%APP_HOME%\lib\java-statsd-client-3.0.1.jar;%APP_HOME%\lib\httpmime-4.5.2.jar;%APP_HOME%\lib\persistence-api-2.1.jar;%APP_HOME%\lib\commons-lang3-3.5.jar;%APP_HOME%\lib\commons-lang-2.6.jar;%APP_HOME%\lib\javax.ws.rs-api-2.0.jar;%APP_HOME%\lib\javax.annotation-api-1.2.jar;%APP_HOME%\lib\jackson-mapper-asl-1.9.13.jar;%APP_HOME%\lib\ehcache-2.10.2.jar;%APP_HOME%\lib\socket.io-client-0.8.3.jar;%APP_HOME%\lib\netty-socketio-1.7.12.jar;%APP_HOME%\lib\java-sdk-3.1.jar;%APP_HOME%\lib\fastjson-1.2.24.jar;%APP_HOME%\lib\commons-logging-1.2.1-SNAPSHOT.jar;%APP_HOME%\lib\data_mapper.jar;%APP_HOME%\lib\data_common.jar;%APP_HOME%\lib\data_entity.jar;%APP_HOME%\lib\validation-api-1.1.0.Final.jar;%APP_HOME%\lib\hibernate-validator-5.2.2.Final.jar;%APP_HOME%\lib\resteasy-client-3.0.9.Final.jar;%APP_HOME%\lib\resteasy-netty-3.0.14.Final.jar;%APP_HOME%\lib\kryo-2.24.0.jar;%APP_HOME%\lib\kryo-serializers-0.37.jar;%APP_HOME%\lib\netty-3.2.10.Final.jar;%APP_HOME%\lib\netty-all-4.0.34.Final.jar;%APP_HOME%\lib\resteasy-jackson-provider-3.0.14.Final.jar;%APP_HOME%\lib\resteasy-jaxb-provider-3.0.16.Final.jar;%APP_HOME%\lib\jaxb-api-2.2.7.jar;%APP_HOME%\lib\tomcat-embed-core-8.0.11.jar;%APP_HOME%\lib\tomcat-embed-logging-juli-8.0.11.jar;%APP_HOME%\lib\spring-messaging-4.2.5.RELEASE.jar;%APP_HOME%\lib\spring-expression-4.2.5.RELEASE.jar;%APP_HOME%\lib\aopalliance-1.0.jar;%APP_HOME%\lib\spring-web-4.2.5.RELEASE.jar;%APP_HOME%\lib\disconf-core-2.6.36.jar;%APP_HOME%\lib\gson-2.2.4.jar;%APP_HOME%\lib\reflections-0.9.9-RC1.jar;%APP_HOME%\lib\guava-19.0-rc2.jar;%APP_HOME%\lib\aspectjtools-1.7.4.jar;%APP_HOME%\lib\netty-3.9.9.Final.jar;%APP_HOME%\lib\commons-pool-1.6.jar;%APP_HOME%\lib\curator-framework-2.5.0.jar;%APP_HOME%\lib\curator-client-2.5.0.jar;%APP_HOME%\lib\geronimo-jms_1.1_spec-1.1.1.jar;%APP_HOME%\lib\hawtbuf-1.11.jar;%APP_HOME%\lib\geronimo-j2ee-management_1.1_spec-1.0.1.jar;%APP_HOME%\lib\activemq-jms-pool-5.14.3.jar;%APP_HOME%\lib\geronimo-jta_1.0.1B_spec-1.0.1.jar;%APP_HOME%\lib\xbean-spring-4.2.jar;%APP_HOME%\lib\activemq-broker-5.14.3.jar;%APP_HOME%\lib\jsqlparser-0.9.5.jar;%APP_HOME%\lib\httpclient-4.5.2.jar;%APP_HOME%\lib\engine.io-client-0.8.3.jar;%APP_HOME%\lib\json-20090211.jar;%APP_HOME%\lib\netty-buffer-4.1.5.Final.jar;%APP_HOME%\lib\netty-common-4.1.5.Final.jar;%APP_HOME%\lib\netty-transport-4.1.5.Final.jar;%APP_HOME%\lib\netty-handler-4.1.5.Final.jar;%APP_HOME%\lib\netty-codec-http-4.1.5.Final.jar;%APP_HOME%\lib\netty-codec-4.1.5.Final.jar;%APP_HOME%\lib\netty-transport-native-epoll-4.1.5.Final.jar;%APP_HOME%\lib\junit-4.11.jar;%APP_HOME%\lib\poi-3.10-FINAL.jar;%APP_HOME%\lib\poi-ooxml-3.10-FINAL.jar;%APP_HOME%\lib\jboss-logging-3.2.1.Final.jar;%APP_HOME%\lib\classmate-1.1.0.jar;%APP_HOME%\lib\jcip-annotations-1.0.jar;%APP_HOME%\lib\minlog-1.2.jar;%APP_HOME%\lib\objenesis-2.1.jar;%APP_HOME%\lib\kryo-3.0.3.jar;%APP_HOME%\lib\protobuf-java-2.6.1.jar;%APP_HOME%\lib\jackson-jaxrs-1.9.12.jar;%APP_HOME%\lib\jackson-xc-1.9.12.jar;%APP_HOME%\lib\jaxb-impl-2.2.7.jar;%APP_HOME%\lib\dom4j-1.6.1.jar;%APP_HOME%\lib\activemq-openwire-legacy-5.14.3.jar;%APP_HOME%\lib\okhttp-3.5.0.jar;%APP_HOME%\lib\netty-resolver-4.1.5.Final.jar;%APP_HOME%\lib\hamcrest-core-1.3.jar;%APP_HOME%\lib\poi-ooxml-schemas-3.10-FINAL.jar;%APP_HOME%\lib\reflectasm-1.10.1.jar;%APP_HOME%\lib\minlog-1.3.0.jar;%APP_HOME%\lib\jaxb-core-2.2.7.jar;%APP_HOME%\lib\FastInfoset-1.2.12.jar;%APP_HOME%\lib\xml-apis-1.0.b2.jar;%APP_HOME%\lib\okio-1.11.0.jar;%APP_HOME%\lib\xmlbeans-2.3.0.jar;%APP_HOME%\lib\asm-5.0.3.jar;%APP_HOME%\lib\istack-commons-runtime-2.16.jar;%APP_HOME%\lib\jsr173_api-1.0.jar;%APP_HOME%\lib\stax-api-1.0.1.jar;%APP_HOME%\lib\hprose-java-1.6.1.jar;%APP_HOME%\lib\jline-0.9.94.jar;%APP_HOME%\lib\jackson-core-2.7.4.jar;%APP_HOME%\lib\jackson-databind-2.7.4.jar;%APP_HOME%\lib\commons-io-2.1.jar;%APP_HOME%\lib\resteasy-jaxrs-3.0.14.Final.jar;%APP_HOME%\lib\jboss-jaxrs-api_2.0_spec-1.0.0.Final.jar;%APP_HOME%\lib\jboss-annotations-api_1.2_spec-1.0.0.Final.jar;%APP_HOME%\lib\javassist-3.16.1-GA.jar;%APP_HOME%\lib\jackson-core-asl-1.9.13.jar;%APP_HOME%\lib\log4j-api-2.7.jar;%APP_HOME%\lib\jackson-annotations-2.7.0.jar;%APP_HOME%\lib\httpcore-4.4.4.jar;%APP_HOME%\lib\commons-codec-1.9.jar;%APP_HOME%\lib\activation-1.1.1.jar

@rem Execute data_service
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %DATA_SERVICE_OPTS%  -classpath "%CLASSPATH%" cn.mwee.order.service.MFServiceProvider %CMD_LINE_ARGS%

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable DATA_SERVICE_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%DATA_SERVICE_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
